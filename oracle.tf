
# Configure the Microsoft Azure Provider
provider "oci" {
  tenancy_ocid = var.OCI_tenancy_ocid
  user_ocid    = var.OCI_user_ocid
  private_key  = var.OCI_rsa_private_key
  fingerprint  = var.OCI_fingerprint
  region       = var.OCI_region_identifier
}

# # Get a list of Availability Domains
# data "oci_identity_availability_domains" "ads" {
#   compartment_id = var.tenancy_ocid
# }

# # Output the result
# output "show-ads" {
#   value = data.oci_identity_availability_domains.ads.availability_domains
# }