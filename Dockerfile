FROM alpine

# Install Azure CLI
RUN \
    apk update && \
    apk add bash py-pip && \
    apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make && \
    pip --no-cache-dir install -U pip && \
    pip --no-cache-dir install azure-cli && \
    apk del --purge build

RUN az --version


# Update package index and install git
RUN apk add --update git cmake

# Install PowerShell
RUN git clone https://github.com/PowerShell/PowerShell && \
    cd PowerShell && \
    ./tools/install-powershell.sh

#RUN apk add \
#    libicu52 \
#    libunwind8


#RUN git clone https://aur.archlinux.org/snapd.git && \
#    cd snapd && \
#    ls /usr/bin/makepkg && \
#    /usr/bin/makepkg -si && \
#    systemctl enable --now snapd.socket && \
#    ln -s /var/lib/snapd/snap /snap
