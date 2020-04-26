data  "vcd_vapp" "assaf" {
  name = "Assaf"
}

data "vcd_vapp_org_network" "net" {
  vapp_name        = "${data.vcd_vapp.assaf.name}"
  org_network_name = "Sensai-1818"
}

resource "vcd_vapp_vm" "vm" {
  count                          = 1
  vapp_name                      = "${data.vcd_vapp.assaf.name}"
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

  #   override_template_disk {
  #   bus_type         = "parallel"
  #   size_in_mb       = "65536"
  #   bus_number       = 0
  #   unit_number      = 0
  # }
}
