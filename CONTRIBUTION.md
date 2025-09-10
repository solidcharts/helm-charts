# Solid Helm Charts — contribution guide

## Pre-commit hooks

We use [pre-commit](https://pre-commit.com/) to run some checks before committing and automatically generate documentation.

To install the pre-commit hooks, run:

```
pip install pre-commit
pre-commit install
```

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
