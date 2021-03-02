FROM nginx/nginx-prometheus-exporter:0.8.0 as exporter

FROM nginx:latest
COPY --from=exporter /usr/bin/exporter /usr/bin/exporter
ADD status.conf /etc/nginx/conf.d/status.conf
RUN set -eux; \
    cd /usr/local/bin; \
    { \
       echo "#!/bin/bash"; \
       echo "nginx && exporter"; \
    } | tee start.sh \
    && chmod u+x start.sh
ENTRYPOINT /usr/local/bin/start.sh