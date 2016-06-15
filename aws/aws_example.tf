resource "aws_instance" "sample" {
  ami           = "ami-414b7271"
  instance_type = "t2.micro"
  subnet_id = "subnet-ID"
  tags {
  	Name = "Sample"
  	Type = "terraform"
  }
}
