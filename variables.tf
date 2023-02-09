variable "region" {
  type        = string
  default     = "eu-gb"
  description = "Region to deploy to, e.g. eu-gb"

   validation {
    condition     = ( var.region == "eu-gb"  ||
                      var.region == "br-sao" ||
                      var.region == "ca-tor" ||
                      var.region == "jp-tok" ||
                      var.region == "us-east" )
    error_message = "Value of region must be one of eu-gb/br-sao/ca-tor/jp-tok/us-east."
  }
}

variable "zone" {
  type        = string
  default     = "2"
  description = "Zone to deploy to, e.g. 2."

  validation {
    condition     = ( var.zone == "1" ||
                      var.zone == "2" ||
                      var.zone == "3")
    error_message = "Value of zone must be one of 1/2/3."
  }
}

variable "contract" {
  type        = string
  description = "The Contract. You can create the contract by script, see this example: https://github.com/ibm-hyper-protect/linuxone-vsi-automation-samples/tree/master/terraform-hpvs/create-contract"
}

variable "profile" {
  type        = string
  default     = "bz2e-1x4"
  description = <<-DESC
                  Profile used for the VSI. This has to be a secure execution 
                  profile in the format Xz2e-YxZ, e.g. bz2e-1x4
                DESC
}

variable "prefix" {
  type        = string
  default     = "hpvs-automation-sample"
  description = "Prefix to be attached to name of all generated resources"
}


