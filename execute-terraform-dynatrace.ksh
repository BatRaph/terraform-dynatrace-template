#!/bin/ksh

date_save=`date +'%d%m%y-%H%M'`

export TF_LOG_PROVIDER=TRACE
export TF_LOG_PATH=logs/logs-$date_save.txt

echo "INFO - terraform plan terraform-dynatrace $date_save"

terraform plan -out ./plans/terraform-dynatrace.plan-$date_save
