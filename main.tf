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

resource "aws_s3_bucket" "my_s3_bucket"{
  # for_each object notation
  # for_each = {
  #   "first_bucket"  = "bucket_one"
  #   "second_bucket" = "bucket_two" 
  # }
  # for_each set notation
  for_each = toset(["db_bucket_one_${var.accountId}_${var.region}", "db_bucket_two_${var.accountId}_${var.region}"])
  bucket = each.value
  # acl = "public-read"
  # adding acl on s3 bucket resource is deprecated
}

resource "aws_s3_bucket_acl" "my_s3_bucket_acl" {
  for_each = toset(["db_bucket_one_${var.accountId}_${var.region}", "db_bucket_two_${var.accountId}_${var.region}"])
  bucket = each.value
  acl    = "private"
}

# resource "aws_s3_bucket_object" "my_s3_bucket_obj"{
#   for_each = toset(["obj_one", "obj_two"])
#   bucket = aws_s3_bucket.my_s3_bucket.id
#   name = each.value
# }