# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update nginx host for the specific lab

#Remove default.conf file since this lab requires only default.bak
sudo ssh nginx rm /etc/nginx/conf.d/default.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nad32/main/lab03/default.bak
sudo scp /tmp/default.bak                              nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nad32/main/lab03/mywebserver.bak
sudo scp /tmp/mywebserver.bak                              nginx:/etc/nginx/conf.d/mywebserver.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nad32/main/lab03/return_test.bak
sudo scp /tmp/return_test.bak                              nginx:/etc/nginx/conf.d/
