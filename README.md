# Vuestorefront / Odoo Docker

## Introduction

The main purpose of this repo is to allow users to be able to test the Vuestorefront - Odoo Integration.
Main repo's are at:

* https://github.com/vuestorefront-community/odoo for the storefront modules and 
* https://github.com/odoogap/vuestorefront for the modules you need to install on your Odoo server

<div align="center">
  <img src="vsf-odoo.png" alt="Vue Storefront" width="30%"/>
</div>

## Installation

Running this command will build and create new containers but also will initialize the Odoo database if not yet initialized

```bash
$> docker-compose up --build -d
# You might want to check what happens under the hood
$> docker-compose logs -f
```

Now just open http://localhost:3000 for VSF and http://localhost:8069 for Odoo (credentials admin/admin)

> You might not see the top categories (MEN/WOMEN) until the Odoo server is initialized (database init takes time to install all modules)

## Stopping

Running this command will stop but will not clear the Odoo database

```bash
$> docker-compose down
```

## Clearing

Running this command will stop but will not clear the Odoo database

```bash
$> docker-compose down -v
```

## Clearing cache

Running this command will stop but will not clear the Odoo database

```bash
$> docker exec -it redis redis-cli
127.0.0.1:6379> flushall
OK
```
