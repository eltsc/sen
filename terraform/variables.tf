variable "vcd_url" {}
variable "vcd_user" {}
variable "vcd_pass" {}
variable "vcd_org" {}
variable "vcd_vdc" {}
variable "vcd_allow_unverified_ssl" {}
variable "vcd_max_retry_timeout" { default = 3 }


# machines global variables  

variable "catalog_name" {default = "sensai"}
variable "template_name" {default = "template-ubuntu-18.04"}
variable "power_on" {default = true}
variable "accept_all_eulas" {default = true}
variable "expose_hardware_virtualization" { default = false }

# nginx variables
variable "nginx_vapp_name" {
    default = "nginx"
    description = "nginx Vapp name"
}
variable "nginx_name" {
    default = "nginx"
    description = "nginx hostname"
}
variable "nginx_memory" {default = "1024"}
variable "nginx_cpus" {default = "2"}
variable "nginx_cpu_cores" { default = "1" }

# ftp variables
variable "ftp_vapp_name" {
    default = "ftp"
    description = "ftp Vapp name"
}
variable "ftp_name" {
    default = "ftp"
    description = "ftp hostanme"
}
variable "ftp_memory" {default = "1024"}
variable "ftp_cpus" {default = "2"}
variable "ftp_cpu_cores" { default = "1" }

# db variables
variable "db_vapp_name" {
    default = "db"
    description = "dv Vapp name"
}
variable "db_name" {
    default = "db"
    description = "db hostname"
}
variable "db_memory" {default = "1024"}
variable "db_cpus" {default = "2"}
variable "db_cpu_cores" { default = "1" }