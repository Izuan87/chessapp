# Catur Cilik - static site served by nginx.
# Base image is multi-arch (linux/amd64, linux/arm64, ...), so the same
# Dockerfile builds for Intel/AMD servers, Apple Silicon, Raspberry Pi, etc.
FROM nginxinc/nginx-unprivileged:1.27-alpine

LABEL org.opencontainers.image.title="Catur Cilik" \
      org.opencontainers.image.description="Chess app for kids (static web app)"

# Runs as non-root (uid 101) and listens on 8080.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Only the site files go into the web root (nginx.conf is deliberately not
# served). .dockerignore is an allowlist as a second safety net.
COPY --chown=101:101 index.html chessapp.html /usr/share/nginx/html/
COPY --chown=101:101 img/ /usr/share/nginx/html/img/
COPY --chown=101:101 subs/ /usr/share/nginx/html/subs/

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO /dev/null http://127.0.0.1:8080/healthz || exit 1
