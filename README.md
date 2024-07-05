
# Terraform Infrastructure for EKS Cluster and Jenkins on AWS

This project sets up an EKS cluster and Jenkins server on AWS using Terraform. The process involves initially launching the Jenkins server locally, then using the Jenkins server to manage the EKS cluster and deploy an nginx server.


![image](https://github.com/mayaworld13/cicd-terraform-eks/assets/127987256/29b5bb34-b9df-4b2f-b4e5-c843b93ee52c)


## Prerequisites

Before you begin, ensure you have:

- AWS Account
- AWS CLI configured with appropriate access
- Terraform installed (v0.12+)
- Jenkins installed and configured on an EC2 instance

## Project Structure

The project is divided into two main parts: the Jenkins setup and the EKS setup.

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

##  Step 1: Jenkins setup

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
7. **Access Jenkins**

After the apply command completes, note the public IP address of your Jenkins server from the Terraform output or the AWS EC2 console.
Open your browser and navigate to `http://<public-ip>:8080`


##  Step 2: Set up EKS Cluster using Jenkins

 1. **Create a new Jenkins Pipeline Job:**

     - Open Jenkins
     - Create a new pipeline job and manage or add the credentials

 2. **Copy the following Jenkinsfile content or run the pipeline script using scm in jenkins**
 3. **In the we are using parmeterized pipeline script as we have to apply or destroy  so here we use choices**

    ![image](https://github.com/mayaworld13/cicd-terraform-eks/assets/127987256/29fa1e21-a108-48f1-aa6d-2e130fbb8ad5)

 4. **Run the Jenkins Pipeline:**

    - Execute the pipeline to automate the EKS cluster deployment and manage Kubernetes resources.


      ![image](https://github.com/mayaworld13/cicd-terraform-eks/assets/127987256/d0fcd2bc-87c6-40bd-a846-c61788cd6dfe)


## Step 3: verification whether nginx server deployed or not

  1. **terraform output give the dns of service or loadbalancer**
  2. **Browse the dns in your browser**

     ![image](https://github.com/mayaworld13/cicd-terraform-eks/assets/127987256/1e56fa80-79e1-4b20-b5ce-d3f9b2b85001)

## Conclusion

This setup automates the deployment of an EKS cluster and a Jenkins server on AWS using Terraform, and manages Kubernetes resources via Jenkins pipelines. Customize the configurations as per your requirements.

  

       
       



