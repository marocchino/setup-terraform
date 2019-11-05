#!/bin/sh -l

if [ -z "$1" ]; then
  echo "run with terraform version:"
  cat <<\USAGE
Usage:
    ./install_terraform.sh <<version>>

version: 0.12.12 (for example, not start with v)
USAGE
  exit 1
fi

tfVersion=$1

url="https://releases.hashicorp.com/terraform/${tfVersion}/terraform_${tfVersion}_linux_amd64.zip"

echo "Downloading Terraform v${tfVersion}"

curl -s -S -L -o /tmp/terraform_${tfVersion} ${url}
if [ "${?}" -ne 0 ]; then
  echo "Failed to download Terraform v${tfVersion}"
  exit 1
fi
echo "Successfully downloaded Terraform v${tfVersion}"

RUNNER_TEMP=${PWD}/runner/tools
echo "::add-path::$RUNNER_TEMP"
mkdir -p "$RUNNER_TEMP"

echo "Unzipping Terraform v${tfVersion}"
unzip -d "$RUNNER_TEMP" /tmp/terraform_${tfVersion} &>/dev/null
if [ "${?}" -ne 0 ]; then
  echo "Failed to unzip Terraform v${tfVersion}"
  exit 1
fi
echo "Successfully unzipped Terraform v${tfVersion}"
