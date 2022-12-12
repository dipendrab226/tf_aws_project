output "instance_id" {
    description = "Instance id of the ec2 instance"
    value = aws_instance.tf_gen_server_3 + "_${count.index}"
}