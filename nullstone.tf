data "ns_workspace" "this" {}

data "ns_agent" "this" {}

locals {
  ns_agent_user_arn = data.ns_agent.this.aws_user_arn
}
