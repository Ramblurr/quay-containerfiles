# Containerfiles for various personal projects

Those containers are built and hosted on Quay.io and most of them are Fedora
based. Some might require volume mounts or manual configuration.

Each `Containerfile` is in a specific branch in this repo:

| Status on Quay.io | Branch | Description |
|-|-|-|
| [![Container Repository on Quay](https://quay.io/repository/ramblurr/nomad/status "Container Repository on Quay")](https://quay.io/repository/ramblurr/nomad) | [nomad](https://github.com/ramblurr/quay-containerfiles/tree/nomad) | [Nomad](https://www.nomadproject.io/) binary with [podman driver](https://github.com/hashicorp/nomad-driver-podman) (binaries only) |
| [![Container Repository on Quay](https://quay.io/repository/ramblurr/consul/status "Container Repository on Quay")](https://quay.io/repository/ramblurr/consul) | [consul](https://github.com/ramblurr/quay-containerfiles/tree/consul) | [consul](https://www.consul.io/) (binaries only) |

