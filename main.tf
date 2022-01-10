
module "module-dynatrace_http_monitor" {
  source                           = "./modules/module-dynatrace_http_monitor"
  OWNER                            = "brice.laurendeau@gmail.com"
  APPLICATION_NAME                 = "SLO-COLLECTOR"
  dynatrace_http_monitor_frequency = 10
  dynatrace_http_monitor_name      = "collect-datadog-slo-health"
}