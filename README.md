# Jenkins Infrastructure on AWS using Terraform

This project provisions a complete infrastructure for Jenkins on AWS using Terraform. It includes a VPC, Security Group, and an EC2 instance running Jenkins.

## Prerequisites

Before you begin, ensure you have the following:

- AWS Account
- AWS CLI configured with appropriate access
- Terraform installed (v0.12+)

## Infrastructure Components

### VPC Module

This module creates a Virtual Private Cloud (VPC) with public subnets.

- **name**: The name of the VPC.
- **cidr**: The CIDR block for the VPC.
- **azs**: Availability zones in the region.
- **public_subnets**: Public subnets CIDR blocks.
- **enable_dns_hostnames**: Enables DNS hostnames in the VPC.
- **map_public_ip_on_launch**: Assigns a public IP to instances launched in the VPC.

Tags are added to help with identification and organization.

### Security Group Module

This module creates a security group for Jenkins.

- **name**: The name of the security group.
- **vpc_id**: The VPC ID where the security group will be created.
- **ingress_with_cidr_blocks**: Ingress rules allowing traffic into the instance.
  - Port 8080 (HTTP) from any IP.
  - Port 22 (SSH) from any IP.
- **egress_with_cidr_blocks**: Egress rules allowing all outbound traffic.

Tags are added to help with identification and organization.

### EC2 Instance Module

This module creates an EC2 instance for Jenkins.

- **name**: The name of the EC2 instance.
- **instance_type**: The type of EC2 instance (e.g., `t2.micro`).
- **key_name**: The name of the key pair for SSH access.
- **monitoring**: Enables detailed monitoring.
- **vpc_security_group_ids**: The security group IDs assigned to the instance.
- **subnet_id**: The subnet ID where the instance will be launched.
- **ami**: The AMI ID for the instance (Ubuntu).
- **associate_public_ip_address**: Associates a public IP with the instance.
- **availability_zone**: The availability zone where the instance will be launched.
- **user_data**: The user data script to install Jenkins on the instance.

Tags are added to help with identification and organization.

## Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/mayaworld13/cicd-terraform-eks.git
   cd cicd-terraform-eks
   ```

2. **Initialize the Terraform resources**
   ```sh
   terraform init
   ```

3. **To structure the look and feel of terraform files**
   ```sh
   terraform fmt
   ```

4. **To validate the syntax**
   ```sh
   terraform validate
   ```

5. **To plan what will be created after running this configeration**
   ```sh
   terrform plan
   ```

6. **Apply the configuration to create the infrastructure**
   ```sh
   terraform apply
   ```
