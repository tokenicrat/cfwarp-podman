FROM alpine:latest
LABEL maintainer="Tokenicrat <hi@bytoken.link>"
ENV WGCF_VERSION=2.2.27
ENV WIREPROXY_VERSION=1.0.9

COPY ./src/setup.sh ./src/entry.sh ./src/default.conf /app/
WORKDIR /app/
RUN chmod +x /app/setup.sh /app/entry.sh \
    /app/setup.sh \
    && rm -rf /app/setup.sh

ENTRYPOINT [ "/app/entry.sh" ]
