resource "null_resource" "eg1" {
    triggers = {
      uuid = uuid()
    }
    provisioner "local-exec"{
        command = "env | grep CLOUD_ID_BASELINE"
    }
  
}




