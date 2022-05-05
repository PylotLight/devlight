
# Configure the Microsoft Azure Provider
provider "oci" {
  tenancy_ocid         = var.OCI_tenancy_ocid
  user_ocid            = var.OCI_user_ocid
  private_key          = base64decode(var.OCI_rsa_private_key)
  private_key_password = var.OCI_rsa_private_key_password
  private_key_path     = ""
  fingerprint          = var.OCI_fingerprint
  region               = var.OCI_region_identifier
}

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = var.OCI_tenancy_ocid
  display_name   = "Internal VCN"
}

resource "oci_core_subnet" "core" {
  vcn_id                     = oci_core_vcn.internal.id
  cidr_block                 = "172.16.0.0/24"
  compartment_id             = var.OCI_tenancy_ocid
  display_name               = "Core Subnet"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "Core"
}

resource "oci_core_subnet" "pub" {
  vcn_id                     = oci_core_vcn.internal.id
  cidr_block                 = "172.16.10.0/24"
  compartment_id             = var.OCI_tenancy_ocid
  display_name               = "Public Subnet"
  prohibit_public_ip_on_vnic = false
  dns_label                  = "Public"
}


# Get a list of Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.OCI_tenancy_ocid
}

# Output the result
output "show-ads" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}