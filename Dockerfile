FROM ethereum/client-go:latest
ADD . /var/zenith
WORKDIR /var/zenith
RUN geth init /var/zenith/genesis.json --datadir /var/zenith/.zenith
ENTRYPOINT [ "geth" , "--config", "/var/zenith/config.toml", "--http", "--http.port", "8545", "--http.api", "eth,net,web3,debug,txpool", "http.corsdomain", "*", "--http.addr", "0.0.0.0", "--ws", "--ws.port", "8546", "--ws.addr", "0.0.0.0", "--ws.api", "eth,net,web3,debug,txpool", "--ws.origins", "*"]

                                                                                                                        
