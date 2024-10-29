variable "secretsmanager_secret_arns" {
  description = "The list of Secrets Manager secret ARNs to monitor."
  type        = list(string)
}

variable "secretsmanager_secret_events" {
  description = "The list of event names to monitor for each Secrets Manager secret."
  type        = list(string)
  default     = ["GetSecretValue", "PutSecretValue", "UpdateSecret", "DeleteSecret"]
}

variable "cw_log_group_name" {
  description = "The name of the CloudWatch log group storing CloudTrail logs."
  type        = string
}

variable "cw_metric_filter_namespace" {
  description = "The namespace for the CloudWatch metric filter."
  type        = string
  default     = "SecretsManager/Monitoring"
}

variable "cw_metric_filter_value" {
  description = "The value to publish to the CloudWatch metric."
  type        = string
  default     = "1"
}

variable "cw_metric_filter_alarm_comparison_operator" {
  description = "The comparison operator for the CloudWatch metric filter alarm."
  type        = string
  default     = "GreaterThanOrEqualToThreshold"
}

variable "cw_metric_filter_alarm_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
  default     = 1
}

variable "cw_metric_filter_alarm_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = number
  default     = 300
}

variable "cw_metric_filter_alarm_statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
  default     = "Sum"
}

variable "cw_metric_filter_alarm_threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
  default     = 1
}

variable "cw_metric_filter_alarm_actions" {
  description = "The list of actions to execute when the alarm transitions into an ALARM state from any other state."
  type        = list(string)
  default     = []
}
