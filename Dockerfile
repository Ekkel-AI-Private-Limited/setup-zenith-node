FROM ethereum/client-go:latest
ADD . /var/zenith
WORKDIR /var/zenith
RUN geth init /var/zenith/genesis.json --datadir /var/zenith/.zenith
ENTRYPOINT [ "geth" , "--config", "/var/zenith/config.toml" ]



