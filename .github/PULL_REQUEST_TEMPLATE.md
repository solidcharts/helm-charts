<!--
 Before you open the request please review the following guidelines and tips to help it be more easily integrated

 Thank you for contributing! We will try to test and integrate the change as soon as we can.
 -->

### Changelog for modified charts

We are trying to maintain a consistent chart changelog to simplify the maintenance of the charts and upgrade process for all users. Please modify the `CHANGELOG.md` for the modified chart according to pattern described there.

### Helm chart documentation

Each chart has a `README.md` file describing the usage of the chart. Documentation is generated
using [helm-docs](https://github.com/norwoodj/helm-docs) so please document your changes (`values.yaml`) accordingly.

To automatically re-generate docs use pre-commit hooks. See more details in the [CONTRIBUTING.md](../CONTRIBUTING.md) file.

### Helm chart release

If you would like to make a release as an outcome of this pull request please also update the chart version in the `Chart.yaml` file and `CHANGELOG.md` accordingly.

### Checklist

<!-- [Place an '[X]' (no spaces) in all applicable fields. Please remove unrelated fields.] -->

- [ ] Variables are documented in the `values.yaml` and `README.md` has been updated (re-generated using helm-docs).
- [ ] Title of the pull request follows conventional commits pattern using chart name as a scope (e.g. `feat(rabbitmq): some change`)
- [ ] `CHANGELOG.md` has been updated with a description of the change (see `CHANGELOG.md` for details).`
- [ ] [Optional] Chart version bumped in `Chart.yaml` according to [semver](http://semver.org/). This is _not necessary_ when the changes can wait until the next release.
