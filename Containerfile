FROM registry.fedoraproject.org/fedora:34 as unzip

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

# From https://www.vaultproject.io/downloads
ENV VAULT_VERSION="1.8.2"
ENV VAULT_SHA256="d74724d6cc22bf1e1c7c519009b0176809acf6f1c20ee56107de0cab54cd8463  vault_1.8.2_linux_amd64.zip"
ENV VAULT_UNSEAL_VERSION=0.0.7
ENV VAULT_UNSEAL_SHA256="31b691a0551b0a14524528841d4b87d4c920bb303a398aa4bb58a1861dfe7641 vault-unseal_0.0.7_linux_amd64.tar.gz"

RUN set -ex; \
  curl -LO \
    https://github.com/lrstanley/vault-unseal/releases/download/v${VAULT_UNSEAL_VERSION}/vault-unseal_${VAULT_UNSEAL_VERSION}_linux_amd64.tar.gz ; \
  echo "${VAULT_UNSEAL_SHA256}" | sha256sum --check ; \
  tar  -xzvf vault-unseal_${VAULT_UNSEAL_VERSION}_linux_amd64.tar.gz vault-unseal

RUN set -ex ; \
  curl -O "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" ; \
  echo "${VAULT_SHA256}" | sha256sum --check ; \
  unzip vault_${VAULT_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /vault .
COPY --from=unzip /vault-unseal .
CMD ["/vault"]
