# Terraform AWS Static Website Hosting

## Project Overview

This Terraform project allows you to create an infrastructure for hosting a static website on Amazon Web Services (AWS) using Amazon S3. The infrastructure includes the setup of an S3 bucket, enabling static website hosting, uploading website files, and configuring public access to the website content. It also includes the configuration of a custom error page and the ownership of the bucket.

## Project Files

The project includes the following key files:

- `main.tf`: Contains the main Terraform configuration for creating the S3 bucket, uploading website files, configuring public access, and defining the website's behavior.
- `providers.tf`: Specifies the required AWS provider and configures the AWS region.
- `variable.tf`: Defines a Terraform variable for the bucket name, allowing flexibility when naming your S3 bucket.

In addition to the Terraform files, the project includes the following static website files:

- `index.html`: The main HTML page for your static website.
- `error.html`: An error HTML page for handling errors on the website.
- `profile.jpg`: An image file to be hosted on the website.

## Getting Started

Follow these steps to execute the project and host your static website on AWS:

1. **Clone the Project**: Clone this project repository to your local machine.

2. **Install Terraform**: If you haven't already, install Terraform on your local machine. You can download it from the official Terraform website (https://www.terraform.io/downloads) and follow the installation instructions for your operating system.

3. **AWS Configuration**: Ensure that you have an AWS account with appropriate permissions. Configure your AWS credentials using the AWS CLI or environment variables.

4. **Modify Variables**: Open the `variable.tf` file and modify the `bucket` variable to specify the name of your S3 bucket.

5. **Initialize Terraform**: In your terminal, navigate to the project directory and run the following command to initialize Terraform:

6. **Apply Configuration:** Apply the Terraform configuration to create the infrastructure:

7. **Test Your Website:** Access your static website by using the URL provided by AWS or your custom domain (if configured).
