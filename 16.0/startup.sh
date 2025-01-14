#!/bin/bash

function install_vuestorefront() {
    if [ ! -d "/mnt/extra-addons/graphql_vuestorefront" ];
    then 
        git clone --recurse-submodules --branch 16.0 https://github.com/erpgap/alokai-odoo.git /mnt/extra-addons/
        /entrypoint.sh odoo -d v16_odoo --max-cron-threads 0 --no-http --stop-after-init -i graphql_alokai
        /entrypoint.sh odoo shell -d v16_odoo --max-cron-threads 0 --stop-after-init --no-http < /start_script.py 
    fi
}
install_vuestorefront && /entrypoint.sh odoo
exit 0