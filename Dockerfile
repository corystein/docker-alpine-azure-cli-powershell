FROM gliderlabs/alpine:latest

# Install Azure CLI
#RUN \
#    apk update && \
#    apk add bash py-pip && \
#    apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make && \
#    pip --no-cache-dir install -U pip && \
#    pip --no-cache-dir install azure-cli && \
#    apk del --purge build

#RUN az --version

RUN apk git && \
    git clone https://aur.archlinux.org/snapd.git && \
    cd snapd && \
    makepkg -si && \
    systemctl enable --now snapd.socket && \
    ln -s /var/lib/snapd/snap /snap