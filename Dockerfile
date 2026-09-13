FROM jyucoeng/komari:latest
USER root
RUN apt-get update && apt-get install -y --no-install-recommends busybox || apk add --no-cache busybox
RUN cp /app/restore.sh /app/restore-manual.sh
RUN printf '#!/usr/bin/env bash\nexit 0\n' > /app/restore.sh && chmod +x /app/restore.sh
RUN sed -i '/restore\.sh/d' /etc/crontabs/* || true
