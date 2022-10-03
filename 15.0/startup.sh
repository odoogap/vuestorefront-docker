#!/bin/bash

function install_vuestorefront() {
    if [ ! -d "/mnt/extra-addons/graphql_vuestorefront" ];
    then 
        git clone --recurse-submodules --branch 15.0 https://github.com/odoogap/vuestorefront.git /mnt/extra-addons/
        /entrypoint.sh odoo -d v15_odoo --max-cron-threads 0 --no-http --stop-after-init -i graphql_vuestorefront
        /entrypoint.sh odoo shell -d v15_odoo --max-cron-threads 0 --stop-after-init --no-http < /start_script.py 
    fi
}
install_vuestorefront && /entrypoint.sh odoo
exit 0