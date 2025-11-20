# Thanos Helm Chart Changelog

> [!NOTE]
> All notable changes to this project will be documented in this file; the format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and this
> project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--
### Added - For new features.
### Changed - For changes in existing functionality.
### Deprecated - For soon-to-be removed features.
### Removed - For now removed features.
### Fixed - For any bug fixes.
### Security - In case of vulnerabilities.
-->

## [UNRELEASED]

## [v0.9.0] - 2025-11-20

### Added
- Support for per-component `initContainers` (query, queryFrontend, compactor, ruler, bucketweb, receiver.ingestor, receiver.router, storeGateway). Default values are empty arrays.

## [v0.8.0] - 2025-11-19

### Added

- Support setting annotations on objstore secret

## [v0.7.0] - 2025-11-17

### Changed

- Upgraded thanos image from `v0.39.2` to `v0.40.1`

## [v0.6.1] - 2025-11-07

### Fixed

- Correct generation of thanos ruler query url when ingress of query or query frontend is enabled (should be first paths path taken instead of assumption of
  single path element). If you set `queryFrontend.ingress.path` as workaround right now correct value from `queryFrontend.ingress.hosts[0].paths[0].path` will
  be used.
- Extra fail messages when `ruler.rules.value` is not set and `ruler.enabled` with `ruler.rules.create` is set to `true`.
- Small documentation fixes.

## [v0.6.0] - 2025-11-06

### Changed

- Add support for additional resources

## [v0.5.2] - 2025-10-14

### Changed

- Update description and artifacthub configuration

## [v0.5.1] - 2025-10-13

### Changed

- Update description

## [v0.5.0] - 2025-10-03

### Changed

- Set `image.tag` and use `appVersion` as fallback

## [v0.4.0] - 2025-10-02

### Changed

- Set `appVersion` to `v0.39.2` (do not add prefix automatically to image tags) to be consistent with other charts

## [v0.3.0] - 2025-09-15

### Changed

- Version of a shared library with an option to provide appVersion prefix for image tags

## [v0.2.0] - 2025-09-12

### Changed

- Ingress settings (dropped `ingress.path` for `ingress.tls` array with paths included)
- Changed `serviceMonitor.additionalLabels` to `serviceMonitor.labels`
- Changed `commons.*` to `components.*`
- Separated image registry/repository property under `image.registry` and `image.repository` instead of single `image.repository`
- Global image registry property under `global.imageRegistry` allowing to override it for all images

## [v0.1.0] - 2025-09-10

### Added

- Initial release based on [v0.39.2](https://github.com/thanos-io/thanos/releases/tag/v0.39.2).
