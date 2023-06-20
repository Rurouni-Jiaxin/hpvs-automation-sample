# Deploying an IBM Cloud Hyper Protect Virtual Server on VPC
The sample below demonstrates using Terraform to deploy a Hyper Protect Virtual Server on  IBM Cloud® Virtual Private Cloud.

Please check the [Terraform documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli?in=terraform%2Faws-get-started) for installation instructions on your operating system.

## Introduction
Virtual server instances for VPC:
Please read about [this](https://cloud.ibm.com/docs/vpc?topic=vpc-about-advanced-virtual-servers&interface=ui)

A special offering based on LinuxONE and IBM's Secure Executiion technology is [confidential computing](https://cloud.ibm.com/docs/vpc?topic=vpc-about-se&interface=ui)

## Setting Up Your IBM Cloud Account
Please visit [IBM Cloud](https://cloud.ibm.com/)
To get your API key, please refer to [this]([IBM Cloud Provider](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs#authentication) to get your API key) documentation.
## The Deployment
Inside terraform.tf, you configure the code to use IBM Cloud as your provider for creating VPC infrastructure
```terraform
 ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.45.1"
    }
```

and the dedicated [IBM Hyper Protect provider](https://registry.terraform.io/providers/ibm-hyper-protect/hpcr/) for s390x Secure Execution servers
```terraform
 hpcr = {
      source  = "ibm-hyper-protect/hpcr"
      version = ">= 0.1.1"
    }
```
  **Note:** *this particular Terraform provider uses the [OpenSSL](https://www.openssl.org/) binary for all cryptographic operations due to its existing [FIPS](https://en.wikipedia.org/wiki/FIPS_140-2) certification. Make sure to have the [OpenSSL](https://www.openssl.org/) binary installed.*

IBM Cloud® VPC has datacenters all over the world, grouped into regions. Within each region, there are multiple isolated datacenters known as Availability Zones (AZs).

Within variables.tf, there are checks for your input variables. As for the ```contract``` ,
please learn about the [prerequisite](https://cloud.ibm.com/docs/vpc?topic=vpc-about-contract_se&interface=ui) for creating a virtual server instance. Also, learn about profile selection for the instance [here](https://cloud.ibm.com/docs/vpc?topic=vpc-vs-profiles&interface=ui)

Run
```bash
terraform init
```

and

```bash
terraform apply
```

This will create a virtual server. Monitor your logging instance for the messages produced by the container workload you deployed.

To stop the virtual server and free the resources, run
```bash
terraform destroy
```