\# Terraform Automatic Deployment Using GitHub Actions



\## Project Overview



This project demonstrates automated Infrastructure as Code (IaC) deployment on AWS using Terraform and GitHub Actions.



Whenever code is pushed to the `main` branch, GitHub Actions automatically executes Terraform initialization, validation, planning, and deployment.



Terraform uses Amazon S3 as a remote backend to store the infrastructure state.



\## Architecture



```text

Developer

&#x20;  |

&#x20;  | Git Push to main

&#x20;  v

GitHub Repository

&#x20;  |

&#x20;  v

GitHub Actions Workflow

&#x20;  |

&#x20;  |-- Checkout Repository

&#x20;  |-- Setup Terraform

&#x20;  |-- Terraform Init

&#x20;  |-- Terraform Validate

&#x20;  |-- Terraform Plan

&#x20;  |-- Terraform Apply

&#x20;  |

&#x20;  v

AWS Cloud

&#x20;  |

&#x20;  |-- VPC

&#x20;  |-- Subnet

&#x20;  |

&#x20;  v

Amazon S3

&#x20;  |

&#x20;  |-- Remote Terraform State

```



\## Technologies Used



\- AWS

\- Terraform

\- GitHub

\- GitHub Actions

\- Amazon S3

\- AWS IAM

\- Git and GitHub



\## Project Structure



```text

terraform-auto-deployment-practice-using-GitHubactions-Pipelines/

│

├── .github/

│   └── workflows/

│       └── terraform-cicd.yml

│

├── .gitignore

├── .terraform.lock.hcl

├── backend.tf

├── main.tf

├── output.tf

├── provider.tf

└── variables.tf

```



\## AWS Resources Created



| Resource | Configuration |

|---|---|

| VPC | ravali-vpc |

| VPC CIDR | 10.0.0.0/16 |

| Subnet | ravali-subnet |

| Subnet CIDR | 10.0.1.0/24 |

| AWS Region | us-east-1 |

| S3 Bucket | ravali-terraform-auto-state-2026 |



\## Terraform Configuration



\### provider.tf



Configures the AWS provider and deployment region.



\### variables.tf



Defines configurable variables for VPC and subnet CIDR blocks and names.



\### main.tf



Creates the AWS VPC and subnet resources.



\### output.tf



Displays the VPC ID, VPC CIDR, subnet ID, and subnet CIDR after deployment.



\### backend.tf



Configures Amazon S3 as the Terraform remote backend.



Remote state configuration:



\- Bucket: `ravali-terraform-auto-state-2026`

\- Key: `terraform-auto-deployment/terraform.tfstate`

\- Region: `us-east-1`

\- Encryption: Enabled

\- S3 versioning: Enabled

\- State locking: S3 lockfile



\## GitHub Actions Configuration



Workflow file:



`.github/workflows/terraform-cicd.yml`



\### Deployment Trigger



The workflow automatically starts whenever code is pushed to the `main` branch.



```yaml

on:

&#x20; push:

&#x20;   branches:

&#x20;     - main

```



\### Workflow Execution



1\. Checkout Repository

2\. Setup Terraform

3\. Terraform Init

4\. Terraform Validate

5\. Terraform Plan

6\. Terraform Apply



Terraform Apply uses automatic approval through `-auto-approve`.



\## AWS Authentication



This project uses an AWS IAM user access key and secret key stored securely as GitHub repository secrets.



Required GitHub Secrets:



\- `AWS\_ACCESS\_KEY\_ID`

\- `AWS\_SECRET\_ACCESS\_KEY`



Never commit AWS credentials or secret values to the repository.



\## Deployment Process



1\. Clone the GitHub repository.

2\. Update the Terraform configuration.

3\. Run Terraform formatting and validation locally.

4\. Stage and commit the changes.

5\. Push the changes to the `main` branch.

6\. GitHub Actions automatically starts the workflow.

7\. Terraform creates or updates AWS infrastructure.

8\. Terraform stores the updated state in the S3 backend.

9\. Verify the deployed resources in the AWS Console.



\## Useful Git Commands



```bash

git clone <repository-url>



git status



git add .



git commit -m "Update Terraform configuration"



git push origin main

```



\## Terraform Commands



```bash

terraform fmt -recursive



terraform init



terraform validate



terraform plan



terraform apply

```



\## Important Notes



\- Every push to `main` can automatically modify AWS infrastructure.

\- Review Terraform changes before pushing.

\- Protect the main branch to prevent unintended deployments.

\- Keep the S3 state bucket private.

\- Enable S3 versioning to support state recovery.

\- Never commit Terraform state files or AWS credentials.

\- The `.terraform.lock.hcl` file should be committed to Git.



\## Project Deployment Status



Successfully deployed using GitHub Actions.



\- GitHub Actions workflow: Successful

\- Terraform initialization: Successful

\- Terraform validation: Successful

\- Terraform plan: Successful

\- Terraform apply: Successful

\- AWS VPC: Created

\- AWS subnet: Created

\- S3 remote state: Verified



\## Author



Terraform and AWS DevOps Hands-on Practice



\*\*Project:\*\* Terraform Automatic Deployment Using GitHub Actions

