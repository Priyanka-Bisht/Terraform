# resource "aws_security_group" "var_demo" {
#   name = "terraform-var"
#
#
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = [var.vpn_ip]
#   }
#
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [var.vpn_ip]
#   }
#
#   ingress {
#     from_port   = 53
#     to_port     = 53
#     protocol    = "tcp"
#     cidr_blocks = [var.vpn_ip]
#   }
# }
import "tfplan-functions" as plan

#attrConfig = "values.0.config"
allowed_ip_range_list = ["192.0.0.1/24","192.0.0.1/24","192.0.0.1/24","10.0.0.0/8", "null"]

attrWebNAC = "config.0.web_server_network_access_control.0.allowed_ip_range_list"

allAccessContextMgrALs = plan.find_resources("google_composer_environment")

violatingallowed_ip_range_list =
plan.filter_attribute_not_in_list(allAccessContextMgrALs,
  attrWebNAC,allowed_ip_range_list, true)

 violations = length(violatingallowed_ip_range_list["messages"])

# Main rule
main = rule {
violations is 0
}




# this policy uses the sentinel tfplan/v2 import for terraform
import "tfplan/v2" as tfplan
import "strings"
import "types"

print ("Policy Validation Rule - Block disallowed IP addresses")

 allowed_ip_range_list = [

]

allComposerResources = filter tfplan.resource_changes as _, resource_changes {
	resource_changes.type is "google_composer_environment" and
	resource_changes.mode is "managed" and
	resource_changes.change.actions not contains "delete"
}

deny_ConfigBlockMissing = rule {
	all allComposerResources as _, rc {
		keys(rc.change.after) contains "config"
	}
}

deny_WebNACNotEnabled = rule {
	all allComposerResources as _, rc {
		all rc.change.after.config as _, sp {
			keys(sp) contains "web_server_network_access_control"
		}
	}
}

EnsureComposerAllowedIps_rule = rule when deny_WebNACNotEnabled is true {
	all allComposerResources as _, rc {
		all rc.change.after.config as _, sp {
			all sp.web_server_network_access_control as _, ac {
				all ac.allowed_ip_range as _, ir {
					ir.value in allowed_ip_range_list
				}
			}
		}
	}
}

v = strings.split(tfplan.terraform_version, ".")
version_major = int(v[1])
version_minor = int(v[2])

# the main rule calls the policy rule(s) and evaluates the final sentinel results
main = rule {
	deny_WebNACNotEnabled and
	EnsureComposerAllowedIps_rule and
	version_major >= 13 and
	version_minor >= 0
}
