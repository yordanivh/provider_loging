provider "vsphere" {
  # If you use a domain set your login like this "MyDomain\\MyUser"
  user           = "user"
  password       = "password"
  vsphere_server = "192.168.1.8"
  client_debug = true
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource "null_resource" "eg1" {
    triggers = {
      uuid = uuid()
    }
    provisioner "local-exec"{
        command = "ls -laR"
    }
  
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "foo.bar"
}

resource "null_resource" "eg2" {
    depends_on = [local_file.foo]
    triggers = {
      uuid = uuid()
    }
    provisioner "local-exec"{
        command = "mv foo.bar /"
    }
  
  
}



variable "home" {}
