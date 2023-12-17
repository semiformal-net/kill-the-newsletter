FROM debian:stable-slim as base
ADD https://github.com/leafac/kill-the-newsletter/releases/download/v1.0.1/kill-the-newsletter--linux--v1.0.1.tgz /
RUN tar -xvf kill-the-newsletter--linux--v1.0.1.tgz

FROM debian:stable-slim
COPY --from=base kill-the-newsletter /usr/bin/
COPY configuration.js /app/
WORKDIR /app
ENTRYPOINT ["kill-the-newsletter"]
CMD ["/app/configuration.js"]
