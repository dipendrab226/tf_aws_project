# aws EC2 instance creation
resource "aws_instance" "tf_gen_server3" {
  # a given resource/module cannot use both count and for_each
  # type.name refers to the resource block
  # type.name[index] refers to the individual instance
  count         = 2
  ami           = "ami-08e637cea2f053dfa"
  instance_type = "t2.micro"

  tags = {
    # count index begins from 0
    Name = "${var.tag_name}_${count.index}"
  }
}

# resource "aws_s3_bucket" "my_s3_bucket"{
#   # for_each = {
#   #   "first_bucket"  = "bucket_one"
#   #   "second_bucket" = "bucket_two" 
#   # }
#   for_each = toset(["bucket_one", "bucket_two"])
#   bucket = each.value
#   acl = private
# }

# resource "aws_s3_bucket_object" "my_s3_bucket_obj"{
#   for_each = toset(["obj_one", "obj_two"])
#   bucket = aws_s3_bucket.my_s3_bucket.id
#   name = each.value
# }