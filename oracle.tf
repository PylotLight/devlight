
# Configure the Microsoft Azure Provider
provider "oci" {
  tenancy_ocid     = var.OCI_tenancy_ocid
  user_ocid        = var.OCI_user_ocid
  private_key      = var.OCI_rsa_private_key
  private_key_path = ""
  fingerprint      = var.OCI_fingerprint
  region           = var.OCI_region_identifier
}

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = var.OCI_tenancy_ocid
  display_name   = "Internal VCN"
}

resource "oci_core_subnet" "dev" {
  vcn_id                     = oci_core_vcn.internal.id
  cidr_block                 = "172.16.0.0/24"
  compartment_id             = var.OCI_tenancy_ocid
  display_name               = "Core Subnet"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "Core"
}

# # Get a list of Availability Domains
# data "oci_identity_availability_domains" "ads" {
#   compartment_id = var.tenancy_ocid
# }

# # Output the result
# output "show-ads" {
#   value = data.oci_identity_availability_domains.ads.availability_domains
# }