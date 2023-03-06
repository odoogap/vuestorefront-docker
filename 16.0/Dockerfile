FROM odoo:16.0 AS odoogap

USER root

COPY ./requirements.txt /
COPY ./startup.sh /
COPY ./start_script.py /
COPY ./odoo.conf /etc/odoo/

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && python3 -m pip install --no-cache-dir -r requirements.txt \
    && apt-get clean \
    && chown odoo /etc/odoo/odoo.conf \
    && chown odoo /startup.sh \
    && rm -rf /var/lib/apt/lists/*


USER odoo

CMD ["odoo"]