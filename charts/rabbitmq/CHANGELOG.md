# RabbitMQ Helm Chart Changelog

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

## [v0.5.0] - 2025-11-06

### Changed

- Upgrade to RabbitMQ `4.2.0-management`

## [v0.4.2] - 2025-10-14

### Changed

- Update description and artifacthub configuration

## [v0.4.1] - 2025-10-13

### Changed

- Update description

## [v0.4.0] - 2025-10-03

### Added

- Artifacthub repository metadata

## [v0.3.0] - 2025-10-03

### Changed

- Set `image.tag` and use `appVersion` as fallback

## [v0.2.0] - 2025-09-15

### Changed

- Separated keys for existing password and erlang cookie secrets (`auth.existingPasswordSecret` and `auth.existingErlangCookieSecret`)

## [v0.1.0] - 2025-09-15

### Added

- Initial release.
