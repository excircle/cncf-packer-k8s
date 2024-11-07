packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.0"
      source  = "github.com/hashicorp/amazon"
    }
    
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "cncf-kubernetes" {
  ami_name = "cncf-kubernetes-${var.kubernetes_version}"
  ssh_username  = var.ssh_username
  instance_type = var.instance_type
  region        = var.region
  source_ami    = var.source_ami
  vpc_id        = "vpc-0a9582f9b3dc4de39"
  subnet_id     = "subnet-0676a2ce8689ac21e"
  tags = {
    "Name" : var.packer_tag_name,
    "Environment" : var.packer_tag_environment,
    "Version" : var.packer_tag_version,
    "Project" : var.packer_tag_project
  }
}

build {
  sources = ["source.amazon-ebs.cncf-kubernetes"]

  provisioner "shell" {
    script = "./ansible/install_ansible.sh"
  }

  provisioner "ansible-local" {
    galaxy_file       = "./ansible/requirements.yml"
    playbook_file     = "./ansible/install.yml"
    galaxy_roles_path = "/usr/share/ansible/roles"
  }

  provisioner "shell" {
    script = "./ansible/uninstall_ansible.sh"
  }
}
