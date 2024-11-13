# Infrastructure as Code (IaC)

## Project Structure

This project is organized into distinct folders for deployments, global configuration, reusable modules, and CI/CD workflows.

## Folder Structure

- .github/workflows: Contains GitHub Actions workflows for CI/CD, including deploy.yml for environment deployments and validate.yml for pull request validation.
- azure-terraform-project:
  - deployments: Has environment-specific configurations for dev, staging, and prod with separate terraform.tfvars files. This contains three deployment files (main.tf, outputs.tf, variables.tf) that are structured to be reusable across environments.
  - global: Defines shared configurations across all environments. I have put a random offset string that is used to make unique names here.
  - modules:
    - app_service: The App Service Module sets up the web hosting infrastructure by creating a Resource Group, an App Service Plan, and a Linux Web App. The App Service Plan name combines a base (app_service_plan_name) with a unique suffix (global_suffix) and is configured with a specified SKU for scaling. The Linux Web App name follows the same naming convention (app_service_name + global_suffix) and is associated with the App Service Plan.
    - database: The Database Module sets up the database infrastructure by creating a Resource Group, an Azure SQL Server, and an SQL Database. The SQL Server name is composed of a base (sql_server_name) and a unique suffix (global_suffix). It is configured with a specific version and administrator credentials (username and password) from variables, which is set to sensitive. The SQL Database is created within this server.
    - load_balancer: The Load Balancer Module sets up the load balancing infrastructure by creating a Resource Group, a Public IP, and an Azure Load Balancer. The Public IP name combines a base (public_ip_name) with a unique suffix (global_suffix) for uniqueness. The Load Balancer name is similarly constructed (load_balancer_name + global_suffix).
    - networking: The Network Module sets up the networking infrastructure by creating a Resource Group, a Virtual Network (VNet), Subnets, and a Network Security Group (NSG).  The VNet name combines a base (vnet_name) with a unique suffix (global_suffix), to make sure its unique. Subnets are created dynamically based on the number of entries in var.subnets, each with a custom name and address prefix. The NSG also uses a unique name pattern (nsg_name + global_suffix).
    - storage: The Storage Module sets up the necessary storage infrastructure. It an Azure Storage Account with a unique name, based on s base_name and s global_suffix. It also creates a Resource Group.
  - pictures: Contains images or screenshots used in documentation (e.g., successful deployments or validation screenshots).

## Pre-requisites
  
- Terraform 4.0.1 is installed.
- Azure CLI is installed and you are authenticated.
- GitHub: For CI/CD configuration

## How to Use the Terraform Scripts

1. **Initialize the Project**
You need to download the necessary Terraform providers and prepare your environment.
To do this, you need to navigate to the root folder of this project in your terminal and initialize using the init command:

``` bash  
terraform init
```

2. **Plan the Infrastructure**
Before applying changes, review the plan to see what Terraform will create or modify using the plan command:

``` bash
terraform plan -var-file="terraform.tfvars.<environment>
```

3. **Apply the Configuration**
Deploy the infrastructure using the apply command:

``` bash
terraform apply -var-file="terraform.tfvars.<environment>
```

4. **Destroy the Resources**
When the infrastructure is no longer needed, use the destroy command to clean up all resources:

``` bash
terraform destroy -var-file="terraform.tfvars.<environment>
```

## Output screenshots

![Apply success](pictures/Apply_success.png "Apply success")
![Destroy success](pictures/Destroy_success.png "Destroy success")

## CI/CD Pipeline and Workflows

The CI/CD pipeline uses GitHub Actions to validate and deploy infrastructure changes. The pipeline ensures quality and consistency across environments through structured branching and reviews.

validate.yml: Runs on push requests, excluding the Production branch. This workflow performs syntax formatting (terraform fmt), validation (terraform validate), and security hecks (tflint) across all directories, ensuring quality before code is merged.

deploy.yml: Executes deployments on environment branches (Development, Staging, and Production). It sets the appropriate .tfvars file based on the branch, plans and applies changes, and enforces an approval step before applying changes to Production. Merging into Development or Staging branches automatically triggers deployment workflows, which execute terraform plan and terraform apply in their respective environments.
