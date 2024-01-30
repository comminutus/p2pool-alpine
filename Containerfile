########################################################################################################################
# Base Image
########################################################################################################################
# Core Config
ARG alpine_tag=3.19.1
ARG repo_tag=v3.10

# Ports:
# 3333: Stratum port
# 37888: p2pool peers
# 37889: p2pool mini peers
ARG ports='3333 37888 37889'

# Defaults
ARG build_dir=/tmp/build
ARG license=$build_dir/source/LICENSE
ARG dist_dir=$build_dir/dist
ARG install_dir=/usr/local/bin
ARG uid=10000
ARG user=p2pool
ARG repo=https://github.com/SChernykh/p2pool.git

FROM alpine:${alpine_tag} as base


########################################################################################################################
# Build Image
########################################################################################################################
FROM base as build
ARG build_dir dist_dir repo repo_tag

WORKDIR $build_dir

# Update base Alpine system and add build packages
RUN apk update
ARG build_packages='cmake curl-dev g++ git libuv-dev make zeromq-dev'
RUN apk add $build_packages

# Download source
RUN git clone --recursive $repo source
WORKDIR $build_dir/source
RUN git checkout $repo_tag
RUN git submodule sync
RUN git submodule update --init --force

RUN cmake .
RUN make -j$(nproc)
RUN mkdir -p $dist_dir
RUN cp p2pool $dist_dir/


########################################################################################################################
# Final Image
########################################################################################################################
FROM base as final
ARG dist_dir install_dir license ports uid user

WORKDIR /home/p2pool

# Upgrade pre-installed Alpine packages and install runtime dependencies
RUN apk --no-cache upgrade
ARG runtime_packages="libcurl libuv libzmq"
RUN apk add --no-cache $runtime_packages

# Install binaries
RUN mkdir -p "$install_dir"
COPY --from=build $dist_dir                 $install_dir
COPY --from=build $license /usr/share/licenses/p2pool/

# Environment variables, overridable from container
ENV P2POOL_ADD_PEERS=
ENV P2POOL_CONFIG=
ENV P2POOL_DATA_API=
ENV P2POOL_HOST=
ENV P2POOL_IN_PEERS=
ENV P2POOL_LIGHT_MODE=
ENV P2POOL_LOCAL_API=
ENV P2POOL_LOG_LEVEL=
ENV P2POOL_MINI=
ENV P2POOL_NO_AUTO_DIFF=
ENV P2POOL_NO_CACHE=
ENV P2POOL_NO_COLOR=true
ENV P2POOL_NO_DNS=
ENV P2POOL_NO_RANDOMX=
ENV P2POOL_NO_UPNP=
ENV P2POOL_OUT_PEERS=
ENV P2POOL_P2P=
ENV P2POOL_P2P_EXTERNAL_PORT=
ENV P2POOL_RPC_LOGIN=
ENV P2POOL_RPC_PORT=
ENV P2POOL_SOCKS5=
ENV P2POOL_START_MINING=
ENV P2POOL_STRATUM=
ENV P2POOL_UPNP_STRATUM=
ENV P2POOL_WALLET=
ENV P2POOL_ZMQ_PORT=


# Create user
RUN addgroup -g $uid -S $user && adduser -u $uid -S -D -G $user $user

# Copy container entrypoint script into container
COPY entrypoint.sh .

# Change ownership of all files in user dir and data dir
RUN chown -R $user:$user /home/$user

# Expose ports
EXPOSE $ports

# Run as user
USER $user

# Run entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
