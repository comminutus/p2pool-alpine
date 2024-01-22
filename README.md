# p2pool-alpine
[![License](https://img.shields.io/badge/License-GPL%203.0-blue.svg)](https://opensource.org/licenses/GPL-3.0)
[![CI](https://github.com/comminutus/p2pool-alpine/actions/workflows/ci.yaml/badge.svg)](https://github.com/comminutus/p2pool-alpine/actions/workflows/ci.yaml)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/comminutus/p2pool-alpine)](https://github.com/comminutus/p2pool-alpine/releases/latest)


## Description
`p2pool-alpine` is a [p2pool](https://github.com/p2pool/p2pool) container image compiled for Alpine Linux.

## Getting Started
```
podman pull ghcr.io/comminutus/p2pool-alpine
podman run -it --rm ghcr.io/comminutus/p2pool-alpine
```

## Usage

### Environment Variables and Options
All configuration options from `p2pool` can be set directly via environment variables.  They correspond to the '`--`'
options that `p2pool` supports.  For help regarding a specific option, consult `p2pool --help`

**Supported Environment Variables:**

| Environment Variable          | `p2pool` option       | Default Value |
| ------------------------------| ----------------------| ------------- |
| `P2POOL_ADD_PEERS`            | `--addpeers`          |               |
| `P2POOL_CONFIG`               | `--config`            |               |
| `P2POOL_DATA_API`             | `--data-api`          |               |
| `P2POOL_HOST`                 | `--host`              |               |
| `P2POOL_IN_PEERS`             | `--in-peers`          |               |
| `P2POOL_LIGHT_MODE`           | `--light-mode`        |               |
| `P2POOL_LOCAL_API`            | `--local-api`         |               |
| `P2POOL_LOG_LEVEL`            | `--loglevel`          |               |
| `P2POOL_MINI`                 | `--mini`              |               |
| `P2POOL_NO_AUTO_DIFF`         | `--no-autodiff`       |               |
| `P2POOL_NO_CACHE`             | `--no-cache`          |               |
| `P2POOL_NO_COLOR`             | `--no-color`          |               |
| `P2POOL_NO_DNS`               | `--no-dns`            |               |
| `P2POOL_NO_RANDOMX`           | `--no-randomx`        |               |
| `P2POOL_NO_UPNP`              | `--no-upnp`           |               |
| `P2POOL_OUT_PEERS`            | `--out-peers`         |               |
| `P2POOL_P2P`                  | `--p2p`               |               |
| `P2POOL_P2P_EXTERNAL_PORT`    | `--p2p-external-port` |               |
| `P2POOL_RPC_LOGIN`            | `--rpc-login`         |               |
| `P2POOL_RPC_PORT`             | `--rpc-port`          |               |
| `P2POOL_SOCKS5`               | `--socks5`            |               |
| `P2POOL_START_MINING`         | `--start-mining`      |               |
| `P2POOL_STRATUM`              | `--stratum`           |               |
| `P2POOL_UPNP_STRATUM`         | `--upnp-stratum`      |               |
| `P2POOL_WALLET`               | `--wallet`            |               |
| `P2POOL_ZMQ_PORT`             | `--zmq-port`          |               |

For options that don't take an argument, you can set them either to _1_ or _true_ to turn them on.

### User/Group
The container uses a user named _p2pool_ with a UID of _10000_, with a group that matches the same.
If you'd like to change this, rebuild the container and set the `uid` build argument.

### Ports
The container exposes the following ports:
| Port  | Use                                     |
| ----- | --------------------------------------- |
| 3333  | Stratum server listen port              |
| 37888 | p2pool peer-to-peer communications      |
| 37889 | p2pool mini peer-to-peer communications |

## License
This project inherits p2pool's GPL-3.0 license - see the [LICENSE](LICENSE) file for details.
