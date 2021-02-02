  
#/bin/bash

# Download and install V2Ray
mkdir /tmp/v2ray
curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl

# Remove temporary directory
rm -rf /tmp/v2ray

# V2Ray new configuration
install -d /usr/local/etc/v2ray
cat << EOF > /usr/local/etc/v2ray/config.json
{
    "inbounds": [
        {
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$UUID",
                        "alterId": 64
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "wsSettings": {
                      "path": "/xxx"
                      },
                "network": "ws"
            },
            "port": 48065,
            "listen":"127.0.0.1"
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

# Run V2Ray
/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json &


mkdir -p ~/.ssh
cd ~/.ssh


cat > ed25519.pub <<'eof'
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFkfVDKMlu99XttAcT0BdQg3rsbYUii09bkLzROUIhDO ed25519
eof

cat > hostkey <<'eoooof'
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAQEAxuDBRUII+/MmtjszSKEW6B2m2wO/DXQ0oClYne4UsAXZIx6BlKrK
ge/wwv9dYTJuy01LQyHfJvqEFPLfPhd7+U61LB5aqUpmi3H6hW0iUC2W7D7gCBFtJbrNVP
qFX4oNz4o+ue0OpSTEfzdRRXZRUjZwpcQviE8riuQatHhnIlJ706KGPW2rpW/uXpr8lSMC
jwVcSiE0cnBMeiNXv+Hs+50IevC7jUn0Wfy0nka20JW2/Hu4nkdrItvjls04qa7hLcDgZp
JwfiLlF/zJnvwi0AH+wbH92xF4zuCaIOGXnKrALpDvK3uZtPVBG7t3DweFaV5LNM9YsiIG
ODgIwquKIQAAA8AUQ1nGFENZxgAAAAdzc2gtcnNhAAABAQDG4MFFQgj78ya2OzNIoRboHa
bbA78NdDSgKVid7hSwBdkjHoGUqsqB7/DC/11hMm7LTUtDId8m+oQU8t8+F3v5TrUsHlqp
SmaLcfqFbSJQLZbsPuAIEW0lus1U+oVfig3Pij657Q6lJMR/N1FFdlFSNnClxC+ITyuK5B
q0eGciUnvTooY9baulb+5emvyVIwKPBVxKITRycEx6I1e/4ez7nQh68LuNSfRZ/LSeRrbQ
lbb8e7ieR2si2+OWzTipruEtwOBmknB+IuUX/Mme/CLQAf7Bsf3bEXjO4Jog4ZecqsAukO
8re5m09UEbu3cPB4VpXks0z1iyIgY4OAjCq4ohAAAAAwEAAQAAAQEAtU38pAj5a8dViVga
/qFs4pr1nECkEb3YpBJNaVy8m2QZefy7oS66gw6c7QgktxFlFA4ZCNB+QWistPRdNJvwN2
3bmKbre94J8iIsgyrk1zdYmXMQhgps+LJ9snTY1ipjQMsFODa23TLRuDBT9QFSTaK3u0dJ
Ffkm9u3Qsqn5S71PFrDG52FzjerSt7JY/Ok5gXjNIFZVp2jgCKgMnmzH18mPUdiaUOdnJy
CP5cXt8xwcVpENyf0Aue8lj2Z0JDMX2B75qup6+EcsPBF2ygVvjMSw/Q7gZVDCwlSOw/0v
Qs1M/TLUbnIOcyKIyn9cSRq29Pmfc16yKE3wue+NdC49qQAAAIEAxgvKpKvCAWiM1vBRDb
3HitZ+WPL/fLgAH31Uu3FQFqS6MlugZuHYvPvUX/sU1UId1eF44CTJb2D6yXDxB855rI8H
5vn5EAyP1gppS+00rJAWpr2Q4c9OOtVj3Ao+ra8HeFNBM0LSpEI9pN1OQKmXOCTbmAbMNZ
iMeehDdkmSnhgAAACBAOTg8rn8Kk/stkPx+MBpkwJHvXGpHpcGUvPcT95z+gTA4JDXa8l0
cvRPWwOCRXJcFQFVPlpgLyVju7VhZD9LPaig1CfiPiAMC9AvpLd72dSjV08fRNdX4YVSJe
Mpu7tGimjuF+p2TrBztEMw8Hg9XSdp7syZqYDBv45dV+QZwdSrAAAAgQDecbtVlRBW4ejA
xYwl8Zr1t7rkdmeH3L4mEy/BJpIXBF+GcOYiCZzjrrKyuBNQ8fP7VqUnNm4g2bNbb8t1Qc
nsvQ6C+6bonO3VfLYEDQ7G7ZFSMUhJS7Gx2Q+vr/6fp7KzvdRsZzLNnxHb/FNizqc9L6MZ
U3z0pJYEv51LVerkYwAAAAd4QHgubGFuAQI=
-----END OPENSSH PRIVATE KEY-----
eoooof

cat > sshd.conf <<'eof'
Port 2222
HostKey ~/.ssh/hostkey
AuthorizedKeysFile ~/.ssh/ed25519.pub
ClientAliveInterval 30
ClientAliveCountMax 3
eof
$(which sshd) -f sshd.conf -E ~/.ssh/sshlog

cat > ~/.bin/cron <<eof
#!/bin/bash
for i in {0..204}
do
  echo $i
  curl -sL https://$YOUR_APP_NAME.herokuapp.com/$(whoami)
  sleep 1500
done
eof
chmod +x ~/.bin/cron

rm -rf /init.sh

cat > Caddyfile <<eof
{
	auto_https off
}
http://127.0.0.1:3333 { 
	root * ~/.ssh
	file_server
reverse_proxy /xxx 127.0.0.1:48065 {
    header_up -Origin
  }
}
eof

curl -OL https://github.com/caddyserver/caddy/releases/download/v2.1.1/caddy_2.1.1_linux_amd64.tar.gz
tar zxvf caddy_2.1.1_linux_amd64.tar.gz
mkdir -p root
echo "$(whoami)" > ~/.ssh/index.html
# ./caddy file-server -root root -listen 127.0.0.1:3333 &
./caddy start -config Caddyfile &

curl -OL https://github.com/jpillora/chisel/releases/download/v1.6.0/chisel_1.6.0_linux_amd64.gz
gzip -d chisel_1.6.0_linux_amd64.gz
chmod +x chisel_1.6.0_linux_am*
mv chisel_1.6.0_linux_amd64 chisel
./chisel server -p $PORT --proxy http://127.0.0.1:3333

