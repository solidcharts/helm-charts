# Thanos Helm Chart Changelog

> [!NOTE]
> All notable changes to this project will be documented in this file; the format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--
### Added - For new features.
### Changed - For changes in existing functionality.
### Deprecated - For soon-to-be removed features.
### Removed - For now removed features.
### Fixed - For any bug fixes.
### Security - In case of vulnerabilities.
-->

## [UNRELEASED]

## [v0.2.0-rc.2] - 2025-09-12

### Changed

- Ingress settings (dropped `ingress.path` for `ingress.tls` array with paths included)
- Changed `serviceMonitor.additionalLabels` to `serviceMonitor.labels`
- Changed `commons.*` to `components.*`
- Separated image registry/repository property under `image.registry` and `image.repository` instead of single `image.repository`
- Global image registry property under `global.imageRegistry` allowing to override it for all images

## [v0.1.0] - 2025-09-10

### Added

- Initial release based on [v0.39.2](https://github.com/thanos-io/thanos/releases/tag/v0.39.2).

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/solidcharts/helm-charts/tree/main/charts/thanos
[v0.1.0]: https://github.com/solidcharts/helm-charts/releases/tag/thanos-0.1.0
