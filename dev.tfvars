ami_id             = "ami-07f7608a8efba8d78"  # Your specified AMI ID (check if it is available in ca-central-1)
key_name           = "conestoga-pg1-ec2"
cidr_block         = "10.0.0.0/16"
instance_type      = "t3.micro"
subnet_cidr_1a     = "10.0.1.0/24"
subnet_cidr_1b     = "10.0.2.0/24"
db_engine_version  = "15.3"  # Updated PostgreSQL engine version (use the latest available)
db_username        = "dbadmin"  # Updated to avoid reserved username "admin"
