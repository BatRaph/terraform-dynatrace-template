
terraform {
  required_providers {
    dynatrace = {
      source = "dynatrace-oss/dynatrace"
      version = "1.9.1"
    }
  }
}

provider "dynatrace" {
        dt_env_url   = "dynatrace url"
        dt_api_token = "token"
    }
    
resource "dynatrace_http_monitor" "collect-datadog-slo-health" {
  name = var.dynatrace_http_monitor_name
  enabled = true 
  frequency = 10
  locations = ["GEOLOCATION-E266126A762728A2"] 
  anomaly_detection {
    loading_time_thresholds {
      enabled = true 
      thresholds {
        threshold {
          type = "TOTAL" 
          value_ms = 10000 
        }
      }
    }
    outage_handling {
      global_outage = true 
      # local_outage = false 
      # retry_on_error = false 
    }
  }
  script {
    request {
      description = var.dynatrace_http_monitor_name
      method = "GET" 
      url = "https://collect-datadog-slo-tool-ium4ezafla-ew.a.run.app/_health" 
      configuration {
        accept_any_certificate = true 
        follow_redirects = true 
      }
      validation {
        rule {
          type = "httpStatusesList" 
          # pass_if_found = false 
          value = "\u003e=400" 
        }
        rule {
          type = "certificateExpiryDateConstraint" 
          # pass_if_found = false 
          value = "30" 
        }
      }
    }
  }
  tags {
    tag {
      context = "CONTEXTLESS" 
      key = "AppName" 
      source = "USER" 
      value = var.APPLICATION_NAME
    }
    tag {
      context = "CONTEXTLESS" 
      key = "Owner" 
      source = "USER" 
      value = var.OWNER
    }
    tag {
      context = "CONTEXTLESS" 
      key = "GENERATED-BY" 
      source = "USER" 
      value = var.GERENERATED-BY
    }
  }
}
