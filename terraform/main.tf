provider "vcd" {
  user                 = "${var.vcd_user}"
  password             = "${var.vcd_pass}"
  org                  = "${var.vcd_org}"
  vdc                  = "${var.vcd_vdc}"
  url                  = "${var.vcd_url}"
  max_retry_timeout    = "${var.vcd_max_retry_timeout}"
  allow_unverified_ssl = "${var.vcd_allow_unverified_ssl}"
}
/*
module "nginx" {
  source = "./machine"

  vapp_name                      = "${var.nginx_vapp_name}"
  name                           = "${var.nginx_name}"
  catalog_name                   = "${var.catalog_name}"
  template_name                  = "${var.template_name}"
  memory                         = "${var.nginx_memory}"
  cpus                           = "${var.nginx_cpus}"
  cpu_cores                      = "${var.nginx_cpu_cores}"
  power_on                       = "${var.power_on}"
  accept_all_eulas               = "${var.accept_all_eulas}"
  expose_hardware_virtualization = "${var.expose_hardware_virtualization}"
}
*/
module "ftp" {
  source = "./machine"

  vapp_name                      = "${var.ftp_vapp_name}"
  name                           = "${var.ftp_name}"
  catalog_name                   = "${var.catalog_name}"
  template_name                  = "${var.template_name}"
  memory                         = "${var.ftp_memory}"
  cpus                           = "${var.ftp_cpus}"
  cpu_cores                      = "${var.ftp_cpu_cores}"
  power_on                       = "${var.power_on}"
  accept_all_eulas               = "${var.accept_all_eulas}"
  expose_hardware_virtualization = "${var.expose_hardware_virtualization}"
}
/*
module "db" {
  source = "./machine"

  vapp_name                      = "${var.db_vapp_name}"
  name                           = "${var.db_name}"
  catalog_name                   = "${var.catalog_name}"
  template_name                  = "${var.template_name}"
  memory                         = "${var.db_memory}"
  cpus                           = "${var.db_cpus}"
  cpu_cores                      = "${var.db_cpu_cores}"
  power_on                       = "${var.power_on}"
  accept_all_eulas               = "${var.accept_all_eulas}"
  expose_hardware_virtualization = "${var.expose_hardware_virtualization}"
} 
*/