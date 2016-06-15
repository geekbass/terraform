# Variable Definition
variable "web_count" {default = 3} # Define the number of "web" nodes you wish to spin up
variable "lb_count" {default = 1} # Define the number of "lb" nodes

# Configure the VMware vSphere Provider
provider "vsphere" {
 vsphere_server = "vcenter.server"
}

# Define the VM resource
resource "vsphere_virtual_machine" "web" {
 name   = "web-${format("%02d", count.index+1)}"
 folder = "vm_folder"
 vcpu   = 2
 memory = 4096
 datacenter = "datacenter"
 cluster = "vsphereCluster"

# Define the Networking settings for the VM
 network_interface {
   label = "VM Network"
   ipv4_gateway = "10.1.1.1"
   ipv4_address = "10.1.1.19${format("%1d", count.index+1)}"
   ipv4_prefix_length = "24"
 }

# Define Domain and DNS
 domain = "domain.com"
 dns_servers = ["my_consul1", "consul2", "consul3", "8.8.8.8"]

# Define the Disks and resources. The first disk should include the template.
 disk {
   template = "my-centos7-template"
   datastore = "vsanDatastore"
   type ="thin"
 }

 disk {
   size = "5"
   datastore = "vsanDatastore"
   type ="thin"
 }

# Define Time Zone
 time_zone = "America/New_York"

# Loop for Count
 count = "${var.web_count}"
}

# Define the VM resource
resource "vsphere_virtual_machine" "loadbalancer" {
 name   = "load-balancer-${format("%02d", count.index+1)}"
 folder = "vm_folder"
 vcpu   = 1
 memory = 2048
 datacenter = "datacenter"
 cluster = "vsphereCluster"

# Define the Networking settings for the VM
 network_interface {
   label = "VM Network"
   ipv4_gateway = "10.1.1.1"
   ipv4_address = "10.1.1.200"
   ipv4_prefix_length = "24"
 }

# Define Domain and DNS
 domain = "ihtech.com"
 dns_servers = ["my_consul1", "consul2", "consul3", "8.8.8.8"]

# Define the Disks and resources. The first disk should include the template.
 disk {
   template = "my-centos7-template"
   datastore = "vsanDatastore"
   type ="thin"
 }

# Define Time Zone
 time_zone = "America/New_York"

# Loop for Count
 count = "${var.lb_count}"
}
