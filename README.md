# setup-terraform

<p align="left">
  <a href="https://github.com/marocchino/setup-terraform"><img alt="GitHub Actions status" src="https://github.com/marocchino/setup-terraform/workflows/test/badge.svg"></a>
</p>

This action sets up a terraform environment for use in actions by:

- optionally downloading and caching a version of Terraform by version and adding to PATH

# Usage

See [action.yml](action.yml)

Basic:

```yaml
steps:
  - uses: actions/checkout@master
  - uses: marocchino/setup-terraform@v1
    with:
      version: "0.12.15"
  - run: terraform fmt -check=true -write=false -diff -recursive
  - run: terraform init
  - run: terraform plan -detailed-exitcode
```

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
