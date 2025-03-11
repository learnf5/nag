# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update Student Workstation host for the specific lab
# only if need a simpler /etc/hosts file do the following 2 steps
# curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab01/hosts
# sudo cp /tmp/hosts                                  /etc/hosts

# update nginx host for the specific lab
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab03/hosts
sudo scp /tmp/hosts    nginx:/etc/hosts

#Remove default.conf file since this lab requires only default.bak
sudo ssh nginx rm /etc/nginx/conf.d/default.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab03/default.bak
sudo scp /tmp/default.bak                              nginx:/etc/nginx/conf.d/

#Create new directory /etc/nginx/html
sudo ssh nginx mkdir --parents /etc/nginx/html

#Copy the custom "for empty servers" index.html to /etc/nginx/html
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab03/index.html
sudo scp /tmp/index.html                          nginx:/etc/nginx/html/

#Copy example1.html and example3.html to /etc/nginx/html
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab03/example{1,2,3,4}.html
sudo scp /tmp/example{1,3}.html                          nginx:/etc/nginx/html/

#Copy example2.html and example4.html to /etc/nginx/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab03/example{1,2,3,4}.html
sudo scp /tmp/example{2,4}.html                          nginx:/etc/nginx/

#curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab03/mywebserver.bak
#sudo scp /tmp/mywebserver.bak                              nginx:/etc/nginx/conf.d/
