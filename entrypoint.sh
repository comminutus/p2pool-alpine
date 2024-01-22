#!/bin/ash

set -e

args="$@"

if [ -n "$P2POOL_ADD_PEERS" ]; then
    args="$args --addpeers $P2POOL_ADD_PEERS"
fi

if [ -n "$P2POOL_CONFIG" ]; then
    args="$args --config $P2POOL_CONFIG"
fi

if [ -n "$P2POOL_DATA_API" ]; then
    args="$args --data-api $P2POOL_DATA_PI"
fi

if [ -n "$P2POOL_HOST" ]; then
    args="$args --host $P2POOL_HOST"
fi

if [ -n "$P2POOL_IN_PEERS" ]; then
    args="$args --in-peers $P2POOL_IN_PEERS"
fi

if [ -n "$P2POOL_LIGHT_MODE" ] && [ "$P2POOL_LIGHT_MODE" != '0' ] && [ "$P2POOL_LIGHT_MODE" != 'false' ]; then
    args="$args --light-mode"
fi

if [ -n "$P2POOL_LOCAL_API" ] && [ "$P2POOL_LOCAL_API" != '0' ] && [ "$P2POOL_LOCAL_API" != 'false' ]; then
    args="$args --local-api"
fi

if [ -n "$P2POOL_LOG_LEVEL" ]; then
    args="$args --loglevel $P2POOL_LOG_LEVEL"
fi

if [ -n "$P2POOL_MINI" ] && [ "$P2POOL_MINI" != '0' ] && [ "$P2POOL_MINI" != 'false' ]; then
    args="$args --mini"
fi

if [ -n "$P2POOL_NO_AUTO_DIFF" ] && [ "$P2POOL_NO_AUTO_DIFF" != '0' ] && [ "$P2POOL_NO_AUTO_DIFF" != 'false' ]; then
    args="$args --no-autodiff"
fi

if [ -n "$P2POOL_NO_CACHE" ] && [ "$P2POOL_NO_CACHE" != '0' ] && [ "$P2POOL_NO_CACHE" != 'false' ]; then
    args="$args --no-cache"
fi

if [ -n "$P2POOL_NO_COLOR" ] && [ "$P2POOL_NO_COLOR" != '0' ] && [ "$P2POOL_NO_COLOR" != 'false' ]; then
    args="$args --no-color"
fi

if [ -n "$P2POOL_NO_DNS" ] && [ "$P2POOL_NO_DNS" != '0' ] && [ "$P2POOL_NO_DNS" != 'false' ]; then
    args="$args --no-dns"
fi

if [ -n "$P2POOL_NO_RANDOMX" ] && [ "$P2POOL_NO_RANDOMX" != '0' ] && [ "$P2POOL_NO_RANDOMX" != 'false' ]; then
    args="$args --no-randomx"
fi

if [ -n "$P2POOL_NO_UPNP" ] && [ "$P2POOL_NO_UPNP" != '0' ] && [ "$P2POOL_NO_UPNP" != 'false' ]; then
    args="$args --no-upnp"
fi

if [ -n "$P2POOL_OUT_PEERS" ]; then
    args="$args --out-peers $P2POOL_OUT_PEERS"
fi

if [ -n "$P2POOL_P2P" ]; then
    args="$args --p2p $P2POOL_P2P"
fi

if [ -n "$P2POOL_P2P_EXTERNAL_PORT" ]; then
    args="$args --p2p-external-port $P2POOL_P2P_EXTERNAL_PORT"
fi

if [ -n "$P2POOL_RPC_LOGIN" ]; then
    args="$args --rpc-login $P2POOL_RPC_LOGIN"
fi

if [ -n "$P2POOL_RPC_PORT" ]; then
    args="$args --rpc-port $P2POOL_RPC_PORT"
fi

if [ -n "$P2POOL_SOCKS5" ]; then
    args="$args --socks5 $SOCKS5"
fi

if [ -n "$P2POOL_START_MINING" ]; then
    args="$args --start-mining $P2POOL_START_MINING"
fi

if [ -n "$P2POOL_STRATUM" ]; then
    args="$args --stratum $P2POOL_STRATUM"
fi

if [ -n "$P2POOL_UPNP_STRATUM" ] && [ "$P2POOL_UPNP_STRATUM" != '0' ] && [ "$P2POOL_UPNP_STRATUM" != 'false' ]; then
    args="$args --upnp-stratum"
fi

if [ -n "$P2POOL_WALLET" ]; then
    args="$args --wallet $P2POOL_WALLET"
fi

if [ -n "$P2POOL_ZMQ_PORT" ]; then
    args="$args --zmq-port $P2POOL_ZMQ_PORT"
fi


old_ifs=$IFS
set -- $args
IFS=$old_ifs

echo "p2pool" "$@"
exec "p2pool" "$@"
