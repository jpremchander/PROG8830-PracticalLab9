provider "aws" {
  region = "ca-central-1"  
}

# locals block to combine multiple subnet CIDR blocks into a single list
locals {
  # Dynamically merging multiple subnet CIDR blocks into one list
  all_subnets = concat([var.subnet_cidr_1a, var.subnet_cidr_1b], ["10.0.3.0/24", "10.0.4.0/24"])  # Adding extra CIDR for flexibility
}

# Create subnets dynamically based on the concatenated list
resource "aws_subnet" "public_subnet" {
  count             = length(local.all_subnets)  # Creates subnets for each CIDR block in the list
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = local.all_subnets[count.index]  # Dynamically choosing CIDR block from the merged list
  availability_zone = element(["ca-central-1a", "ca-central-1b", "ca-central-1c"], count.index)  # Automatically pick AZ for each subnet
  map_public_ip_on_launch = true
}


# 🔹 Security Module
module "security" {
  source              = "./modules/security"
  vpc_id              = module.vpc.vpc_id  
  allowed_cidr_blocks = ["0.0.0.0/0"]
}

# 🔹 EC2 Module
module "ec2" {
  source             = "./modules/ec2"
  ami_id            = "ami-0abcdef1234567890"  
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.subnet_1a_id  
  security_group_id = module.security.ec2_security_group_id  
}

# 🔹 ALB Module
module "alb" {
  source      = "./modules/alb"
  vpc_id      = module.vpc.vpc_id
  lb_sg_id    = module.security.lb_security_group_id
  subnet_1a_id = module.vpc.subnet_1a_id
  subnet_1b_id = module.vpc.subnet_1b_id
  instance_id  = module.ec2.instance_id  
}

# 🔹 RDS Module
module "rds" {
  source                  = "./modules/rds"
  db_subnet_group_name    = "rds-subnet-group"
  subnet_ids              = [module.vpc.subnet_1a_id, module.vpc.subnet_1b_id]  
  db_parameter_group_name = "rds-parameter-group"
  db_family               = "postgres13"  
  db_identifier           = "practicallab4-db"
  db_engine_version       = "13.7"
  db_instance_class       = "db.t3.micro"
  db_storage             = 20
  db_username            = "admin"
  db_password            = "StrongPassword123!"
  vpc_security_group_ids = [module.security.rds_security_group_id]
  publicly_accessible    = false  
}
