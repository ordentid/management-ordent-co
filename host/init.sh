yum update -y
localedef -i en_US -f UTF-8 en_US.UTF-8
echo 'LANG=en_US.utf-8'  >> /etc/environments
echo 'LC_ALL=en_US.utf-8' >> /etc/environments
sudo amazon-linux-extras install epel -y
sudo yum install git -y
sudo amazon-linux-extras install docker -y
source /root/.bashrc
sudo usermod -a -G docker ec2-user
sudo mkdir -p /usr/local/lib/docker/cli-plugins/
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
OUTPUT=$(curl http://169.254.169.254/latest/meta-data/instance-id)
aws ec2 attach-volume --volume-id vol-0a358d823e912cab2 --device /dev/sdb --instance-id $OUTPUT --region ap-southeast-1
aws ec2 associate-address --instance-id $OUTPUT --allocation-id eipalloc-07f53899e6241d927 --allow-reassociation --region ap-southeast-1
aws ec2 create-tags --resources $OUTPUT --tags Key=Name,Value=hub.ordent.co
sudo mkdir /data
sudo mount /dev/nvme1n1 /data
sudo mkdir -p /data/docker
sudo service docker stop
sudo echo "{
  \"data-root\": \"/data/docker\"
}" >> /etc/docker/daemon.json
sudo service docker start
sudo systemctl enable docker
sudo mkdir -p /home/ec2-user/.ssh
sudo echo "-----BEGIN RSA PRIVATE KEY-----
MIIJKgIBAAKCAgEA0CljDTaIU9SV56yTqNtObm8rwML0zSrKMX3Q0sKCjiDYf/39
6sI1Lr6Wb1g3yR26vAe7YkfExpg11fndkBdURokC+Ak1DqbqTCkElcQGv3oV9Tsg
zW3sLbDsEMrAnrGA7v+17XKSAG6t0/s36aZIVdowoB2cvGEJUt47VIFuOcE+cB4V
7DM6YxR6OBdi8Y7dpU7tB1JYqnxMp5YY7uAp5sqWZQMkkeMg06L1lkh5oI7dkqjA
GzZZ0KqDtc1bmDtmoTUprXZqrgwKT7B7W7i75gwtvRnEbjvfiNGeq8379zQZNCvg
sjmWXRFLv4WP6x8v70VMYX3vxN3m++4wwKjhWmAMK0WCe6VyMT8YMUD75LmPm522
IyiTzl4kUOIMwGPXZA0SnJXXI3ClP6JO/7jDl72J41OSDxmT+tAQKQ5p3eeBzZzL
yZzO2r1gk9fiQgY1iurnFKtpJwpbbKBV39XSheJaixyfUukfphy2nduKqZGDqYAj
6fuFg4qRnCdiwVNDGH4nTwWrL3P4MaopCKDEqt1cRPVyq8vdpZiYlKpeB3HYmUuQ
6aRKrYq+Jml6QpBv0CpO6rQ5wXfWz4fSUuVP3AsY9KjBTYXxvt4OhBnM9Vz726wd
YAFPU5KqFYsALGlUw2sCy9mWMBpcTSQsUrd2WZcS4o1jFTUuxVW1xw/CAR0CAwEA
AQKCAgEAidyfKUUQjNSiY0k8kfyMuT8Pbx6vGqJYPubgwnToGlFOkZYZ8LymlErN
PvjiGWSDI7zLMY/ulsh//zL4tlF9EynyuWr/pLCPQ9l2m+mzvmSQ3lVGqEdAwBII
hiaB45gTmDXqu1PBtl+W6Gnc4fWqupFC2whBodFyZ1ufV5xQ8Bc3zvFd+40CAlSx
jSyP7wN7b9wRx2OWLXMdIXCbGrmDhsJtUIEAW05dk0y98cYWJ2v2+wagFGWunjAQ
Avv6yZutoN6gt61RgeufeJ+dU2XJq9YtBKxoF8m3hdmuiIJneZUbjB3zNpZFK2Yl
ELbYVhPVn1X5/Cd4AJ4mOHvL9gzjEdHWN1kyforal/VmTW2B6R8oFGOn4e1ea5ft
wpOM6plM56oYqswofa6J0dEgieKgPKDQeg/ajV3wSyU2AQKCHIsOYVEcRyATtWLO
EFcKGV45yRnaBi+D1GDNsbwmlWneTOqTzxrGK73ubyRRL0UNxrLMCCRuUEcuyFt/
Un1HxHtLcehzRCDvEis736hX35lJAdCaKAWEOoGW/BxvSS8qv6z/u7b1eEbsmgfb
kRnf1yEbKGKwIbe3fv7V97eh7+G7xWPCkwyiTvl/5tSXckhCXxuuzzCgghXGN+Ll
yq2ykxyEWqa4J40MSVbrQiTT6ZtpkMfz2QoWV2Klm0uwkuuIygECggEBAO4xvwyr
z1zlr0GS0HvsuQNqTkqRuE1aCrnZVp0XRiasKGXig9OB6z7rB1XSN39OVQlHhxV7
9TTtFsUD68G4Rnek36wFfmRembxGJsmysoV3HUmeDQkmLPO5U9I/he7Uo0P1NAdm
AB5s5bQQo1xUsw/YitJv8wquqHBNG+qr+Ke3/L70z51zJT4mJuXHyhVGrgqCFzF7
Zc+09D+LnZMQypd8L5G1pP+Oju2DAe1SzDZMwb6mToGHETvPuiMb2syslqxAMtNB
jvttsjdZ55gkpzxvblr9fh015YAXoZTbZjL+XjkdiFC+/Hhj38Y92vkRxQKimzIp
YLi2iBuZKVg+gSECggEBAN+46ilBvIHG7ebJzXXpOAU4UfNPChLIkA4etCU05410
1dWpqZxmkpUBud+2irlo/zlWO05EW8KNHyILJB+jOrxnG3oGcJy2brARIruxVuEl
n/pmBketza8ZFNqvCALC9Xa7oYBZWM6mH5ZkUtY8kfnzDxrZnR23pV6XvxVfURwg
UpNzQU+d6q1l1KsvoUufzPgOtxMXzpjlulD8UrWDFQfZtRxxFW7YSHzgZqEYGQn6
/OFtpo5SxQ1/e8xSBBhJM2Vbv6UCQlo0lq/SgmpGDAhzEmtKSQvx5zBV7e/KOOZW
0yn/yrANTu8E8s3vg9m9whSWljbHak5jWTkxRH16dH0CggEBAL3dyXxAN7rFGz4Z
2TXvLEscoeuu3EpMS+B47iGqO7D36fvM42flV69/iQlP2A0SU5Zh/buSY5McqdnB
lluEmCcmtWRZvLYk8kaxZJnCZ6sbl6zm3107oPll8PrWx9vog3vYKPD8zXtzMmam
HJGssk8fPQkhU4pgTsO1s1sMWdjXQBC29Ad9kWJI5xiieOMcw/58VCCNTEqU410D
3UctS1AVHZX4RN2wtR1+IDsclMtzw7xEtK9rCsGyg50Yxv//UttbESh0SZUBi92z
PHh6PxRdfonpJm4CWD4SmCof+QcM2+6LK+2xT25nrihHhhSjpXbERxFlCkQyu6vE
GsDMkgECggEAFJrfVjVruzgrKRplBfsY4cIyKgqZjulR+zrwtIyO1wRvvWIG8RSx
Y2/pQqV5WWJGP22lwKujF+QPff8wsIlEG54TdcWqEYTr5ONvI4JN0ia4+UL0SR3E
19+jgBCm2DpEiU72rO+NslqyhhNvXbPubero9TwdsGL9pBytyLYirkh70oDG/yI4
Pwgl8i5M2L47Do2sZuHGcWaXJmZW58jO4w42FAyGQNNCud2hFi02ASlQqSKEOI9+
/qNDL6pOHj5/sVIl8Hioy84UItVslYUmDpEqnR8WYzdAZ79CTtd9LhnJEREyBczz
/CekhTsOFbvYaDUGWL09GUMlMJNND5F7sQKCAQEAy6yAGVOovcn5e041sXhM3okU
0e0mTOKT6YtAvC4idvA8bkrzQYoOqh+WUW14KPvnRGfZ0JWWVypQvFjgpwjndYSi
vXgjoMHuFFttBfVuZTXRyNlgT/2l5CLBSn57JvYKSbwNBU7pRIjvpesaEsypdGuG
TnxoVwkIiVR+Sa/hb/v3QUqRDqsAjQmaZHcjkJbHDHiSh/ypewVWSKyhBcpCxyYm
ujEhloKrXgvAbYF2/wUISd+nQabmnCgLTW2U+zAGnbkGNsK6ayv8VMd4M3CFnkCn
UXUOE2S81Ho66uq4U49gqDAeBoxNd+2iz+BdEJdqiajQvxRyHz//9ZmRKxe+Yg==
-----END RSA PRIVATE KEY-----" >> /home/ec2-user/.ssh/id_rsa
sudo chmod 400 /home/ec2-user/.ssh/id_rsa
eval "$(ssh-agent -s)"
cd /data/hub-ordent-co
sudo docker compose up -d