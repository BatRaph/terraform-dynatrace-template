variable "dynatrace_http_monitor_name" {
    description = "Name of the http_monitor"
    type = string
}

variable "dynatrace_http_monitor_frequency" {
    description = "Frequence of http_monitor execution"
    type = number
   
    validation {
    condition = var.dynatrace_http_monitor_frequency > 0 && var.dynatrace_http_monitor_frequency <= 10
    error_message = "Please set my_var to a positive number or 0."
  }
}

variable "APPLICATION_NAME" {
    description = "Name of application"
    type = string
}

variable "OWNER" {
    description = "Owner name of http_monitor"
    type = string
}

variable "GERENERATED-BY" {
  default = "TERRAFORM-BRICE"
}