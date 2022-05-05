
# Configure the Microsoft Azure Provider
provider "oci" {
  tenancy_ocid = var.OCI_tenancy_ocid
  user_ocid    = var.OCI_user_ocid
  private_key  = var.OCI_rsa_private_key
  fingerprint  = var.OCI_fingerprint
  region       = var.OCI_region_identifier
  #private_key_password = var.OCI_rsa_private_key_password
  #private_key_path     = ""
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
# output "show-ads" {
#   value = data.oci_identity_availability_domains.ads.availability_domains
# }

resource "oci_core_instance" "ubuntu_instance" {
  # Required
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.OCI_tenancy_ocid
  shape               = "VM.Standard.E2.1.Micro"
  source_details {
    source_id   = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaagn3ggfedzmgogki5fqkno7qm4zy64cnbeudxwmjxjlnyavn5jxva"
    source_type = "image"
  }

  # Optional
  display_name = "main-vm"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.pub.id
  }
  # metadata = {
  #     ssh_authorized_keys = file("<ssh-public-key-path>")
  # } 
  preserve_boot_volume = false
}

output "public-ip-for-compute-instance" {
  value = oci_core_instance.ubuntu_instance.public_ip
}

