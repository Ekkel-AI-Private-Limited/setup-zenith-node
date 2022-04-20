# setup-zenith-node

1. Install geth.

2. Download [zenith.json](https://github.com/Ekkel-AI-Private-Limited/setup-zenith-node/blob/main/zenith.json). Initialize geth:
```
geth init zenith.json --datadir /var/zenith/.zenith
```

2. Create config.toml

```
cd /var
mkdir zenith
cd zenith
touch config.toml
```

Copy the contents of [config.toml](https://github.com/Ekkel-AI-Private-Limited/setup-zenith-node/blob/main/config.toml) to this file

3. Create zenith.service
```
cd /lib/systemd/system
sudo touch zenith.service
sudo nano zenith.service
```

```
[Unit]
Description=Zenith Server
After=syslog.target network.target

[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/bin/geth --config /var/zenith/config.toml --nat extip:<YOUR_IP>
KillMode=process
KillSignal=SIGINT
TimeoutStopSec=90
Restart=on-failure
RestartSec=10s
```

Replace <YOUR_IP>

4. Run the service
```
sudo systemctl daemon-reload
sudo systemctl restart zenith
sudo systemctl enable zenith
sudo systemctl status zenith
```

5. To Run As a Docker Client:

```sh
docker build -t geth:v1 .
```


```sh
docker run -it geth:v1
```