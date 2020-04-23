# data "vcd_vapp" "net" {
#   name = "Se"
#

# data "vcd_vapp" "t" {
#   name = "template-test"
# }
# data "vcd_vapp_vm" "vm" {
#   vapp_name = data.vcd_vapp.t.name
#   name      = "ubuntu-server-18.04"
# }

data  "vcd_vapp" "stress" {
  name = "stress"
}
resource "vcd_vapp_vm" "stress1" {
  count = 4

  vapp_name                      = vcd_vapp.stress.name
  name                           = "stress1${count.index}"
  catalog_name                   = "sensai"
  template_name                  = "ubuntu-server-18.04"
  memory                         = 1024
  cpus                           = 2
  cpu_cores                      = 1
  power_on                       = true
  accept_all_eulas               = true
  expose_hardware_virtualization = false
  customization {}

  guest_properties = {
    "guest.hostname" = "my-host${count.index}"
    # "another.var.name" = "var-value"
  }
  # network {
  #   adapter_type       = "VMXNET3"
  #   type               = "org"
  #   name               = data.vcd_vapp_org_network.net.org_network_name
  #   is_primary         = true
  #   ip_allocation_mode = "MANUAL"
  #   ip                 = "10.240.18.10"
  # }
}


data "vcd_vapp_org_network" "net" {
  # org  = "my-org"
  # vdc  = "my-vdc"
  vapp_name        = "template-test"
  org_network_name = "Sensai-1818"
}


# resource "vcd_vapp_network" "vappNet" {
#   # org = "my-org" # Optional
#   # vdc = "my-vdc" # Optional

#   name      = "my-net"
#   vapp_name = vcd_vapp.stress.name
#   gateway   = "10.240.18.254"
#   netmask   = "255.255.255.0"
#   dns1      = "8.8.8.8"
#   dns2      = "8.8.4.4"
#   # dns_suffix         = "mybiz.biz"
#   # guest_vlan_allowed = true

#   # static_ip_pool {
#   #   start_address = "10.240.18.50"
#   #   end_address   = "10.240.18.59"
#   # }

#   dhcp_pool {
#     start_address = "10.240.18.2"
#     end_address   = "10.240.18.252"
#   }
# }
