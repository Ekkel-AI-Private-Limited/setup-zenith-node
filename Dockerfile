FROM ethereum/client-go:latest
ADD . /var/zenith
WORKDIR /var/zenith
RUN geth init /var/zenith/genesis.json --datadir /var/zenith/.zenith
ENTRYPOINT [ "geth" , "--config", "/var/zenith/config.toml", "--http", "--http.port", "8545", "--http.api", "eth,net,web3,debug,clique,txpool", "http.corsdomain", "*", "--http.addr", "0.0.0.0"]

