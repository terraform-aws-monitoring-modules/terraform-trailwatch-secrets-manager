resource "aws_cloudwatch_log_metric_filter" "metric_filter" {
  count          = length(var.secretsmanager_secret_arns)
  log_group_name = var.cw_log_group_name
  name           = replace(replace("${var.secretsmanager_secret_arns[count.index]}-metric-filter", ":", "-"), "*", "-")
  pattern        = "{ ($.eventSource = secretsmanager.amazonaws.com) && ($.requestParameters.secretId = \"${var.secretsmanager_secret_arns[count.index]}\") && ($.eventName = \"${join("\" || $.eventName = \"", var.secretsmanager_secret_events)}\") }"

  metric_transformation {
    name      = replace(replace("${var.secretsmanager_secret_arns[count.index]}-metric-filter", ":", "-"), "*", "-")
    namespace = var.cw_metric_filter_namespace
    value     = var.cw_metric_filter_value
  }
}

resource "aws_cloudwatch_metric_alarm" "metric_filter_alarm" {
  count               = length(var.secretsmanager_secret_arns)
  alarm_name          = replace(replace("${var.secretsmanager_secret_arns[count.index]}-metric-filter", ":", "-"), "*", "-")
  comparison_operator = var.cw_metric_filter_alarm_comparison_operator
  evaluation_periods  = var.cw_metric_filter_alarm_evaluation_periods
  metric_name         = replace(replace("${var.secretsmanager_secret_arns[count.index]}-metric-filter", ":", "-"), "*", "-")
  namespace           = var.cw_metric_filter_namespace
  period              = var.cw_metric_filter_alarm_period
  statistic           = var.cw_metric_filter_alarm_statistic
  threshold           = var.cw_metric_filter_alarm_threshold
  alarm_description   = "Alarm when the resource exceeds the specified threshold."
  alarm_actions       = var.cw_metric_filter_alarm_actions
}
