FROM odoo:14.0 AS odoogap

USER root

COPY ./requirements.txt /

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && python3 -m pip install --no-cache-dir -r requirements.txt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER odoo

CMD ["odoo"]