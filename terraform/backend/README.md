🔧 Terraform Infrastructure Setup

In this section of our project we are installing terraform on our instance and configuring terraform so we can use it to create the infrastructure our app would be deployed on.

After installing terraform, authenticate github to your ec2 instance, authenticate AWS account and also install AWS CLI.

After installing terraform move our statefile to a remote back end using scripts in the files above for security and enanle locking mechanism and versionaing to the bucket and Dynamo DB table we will be creating.

S3 Bucket → stores Terraform state DynamoDB Table → provides state locking

This ensures:

Safe concurrent execution State consistency Recovery through versioning

⚙️ Backend Initialization

<img width="1035" height="975" alt="Screenshot 2026-03-28 074917" src="https://github.com/user-attachments/assets/00fb43a4-dcfa-451e-b1eb-8a63c19607aa" />

The backend was initialized using:

terraform init

🧠 Key Design Decisions Remote state stored in S3 for durability DynamoDB used for locking to prevent concurrent modifications Resources deployed in us-east-1 for maximum service availability

The next phase of this project includes:

Creating a highly available VPC (multi-AZ) Provisioning an EKS cluster Deploying applications using Kubernetes

Enjoy
