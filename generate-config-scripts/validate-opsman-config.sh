#!/bin/bash -e
## original code from https://github.com/tonyelmore/telmore-platform-automation

if [ ! $# -eq 1 ] ; then
    echo "${BASH_SOURCE[0]} FOUNDATION"
    exit
fi  

FOUNDATION=$1

WORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
## TODO will not use IAAS at the moment
##foundation_config_path="$WORK_DIR/../${IAAS}/${FOUNDATION}"
foundation_config_path="$WORK_DIR/../foundations/${FOUNDATION}"


echo "Validating configuration for opsman"
echo "bosh int --var-errs --var-errs-unused \"
echo "  ../foundations/${FOUNDATION}/opsman/opsman.yml \"
echo "  --vars-file ../foundations/${FOUNDATION}/vars/opsman.yml"

touch $foundation_config_path/vars/opsman.yml
bosh int --var-errs --var-errs-unused $foundation_config_path/opsman/opsman.yml \
  --vars-file $foundation_config_path/vars/opsman.yml
