# Changelog

## [1.0.0] - 2024-10-29

### Added
- Initial release of the Secrets Manager Monitoring module.
- Support for monitoring AWS Secrets Manager secrets with custom metric filters and alarms.
- Configurable parameters for Secrets Manager ARNs, event names, and CloudWatch log settings.
- Automatic creation of CloudWatch metric filters based on specified Secrets Manager secrets and their respective events.
- Alarms triggered based on defined thresholds for the specified metrics.
- Detailed variable descriptions for easy customization and configuration.

## [1.0.1] - 2024-10-30

### Changed
- Updated Terraform examples in [`README.md`](README.md) to reference the module source from the Terraform Registry.
