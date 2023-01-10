data "terraform_remote_state" "vpc" {
  backend= "remote"
  config = {
    organization = "demo-tfe"
    workspaces = {
      name = "Network-Team"
    }
  }
}


module "ec2-security-group" {
  source  = "app.terraform.io/demo-tfe/ec2-security-group/aws"
  version = "1.0.3"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}
