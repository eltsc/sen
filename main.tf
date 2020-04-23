provider "vcd" {
  user                 = "${var.vcd_user}"
  password             = "${var.vcd_pass}"
  org                  = "${var.vcd_org}"
  vdc                  = "${var.vcd_vdc}"
  url                  = "${var.vcd_url}"
  max_retry_timeout    = "${var.vcd_max_retry_timeout}"
  allow_unverified_ssl = "${var.vcd_allow_unverified_ssl}"
}

data  "vcd_vapp" "vapp" {
  name = "${var.vapp}"
}

data "vcd_vapp_org_network" "net" {
  vapp_name        = "${data.vcd_vapp.vapp.name}"
  org_network_name = "${var.org_network}"
}

resource "vcd_vapp_vm" "vm" {
  count                          = 1
  vapp_name                      = "${data.vcd_vapp.vapp.name}"
  name                           = "${var.name}"
  computer_name                  = "${var.name}"
  catalog_name                   = "${var.catalog_name}"
  template_name                  = "${var.template_name}"
  memory                         = "${var.memory}"
  cpus                           = "${var.cpus}"
  cpu_cores                      = "${var.cpu_cores}"
  power_on                       = "${var.power_on}"
  accept_all_eulas               = "${var.accept_all_eulas}"
  expose_hardware_virtualization = "${var.expose_hardware_virtualization}"

  customization {
      enabled = true
  }

  network {
    adapter_type       = "VMXNET3"
    type               = "org"
    name               = "${data.vcd_vapp_org_network.net.org_network_name}"
    is_primary         = true
    ip_allocation_mode = "POOL"
  }
}
