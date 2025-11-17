# Solid Helm Charts — contribution guide

## Pre-commit hooks

We use [pre-commit](https://pre-commit.com/) to run some checks before committing and automatically generate documentation.

To install the pre-commit hooks, run:

```
pip install pre-commit
pre-commit install
```

## Changelog

All notable changes to this project are documented in `CHANGELOG.md` file for each chart.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Types of changes

- **Added** - For new features.
- **Changed** - For changes in existing functionality.
- **Deprecated** - For soon-to-be removed features.
- **Removed** - For now removed features.
- **Fixed** - For any bug fixes.
- **Security** - In case of vulnerabilities.

## Tasks

For some automation the project uses [Task](https://taskfile.dev/) - modern task runner, a cross-platform build tool inspired by Make.

## Using `shared` chart

To use `shared` chart with the current (modified locally) version you can reference it like this:

```
dependencies:
  - name: shared
    version: 0.1.0
    repository: file://../shared
```
