# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update lab environment
#sudo ssh nginx test -e /etc/nginx/conf.d/default.conf && sudo ssh nginx rm /etc/nginx/conf.d/default.conf

# install 30 day nginx one trial licenses from Salesforce - EXPIRES April 4, 2025
set +x
#NOT sure if need main directory in pathname since these files are not showing up in my lab system
#curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $LIC_TOKEN" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/EXPIRES-April-4-2025/nginx-one-eval.{crt,key,jwt}
#echo curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/EXPIRES-April-4-2025/nginx-one-eval.{crt,key,jwt}
curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $LIC_TOKEN" https://raw.githubusercontent.com/learnf5/eval-reg-keys/nginx/EXPIRES-April-4-2025/nginx-one-eval.{crt,key,jwt}
echo curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" https://raw.githubusercontent.com/learnf5/eval-reg-keys/nginx/EXPIRES-April-4-2025/nginx-one-eval.{crt,key,jwt}set -x
until sudo scp /tmp/nginx-one-eval.crt nginx:/etc/ssl/nginx/nginx-repo.crt || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.key nginx:/etc/ssl/nginx/nginx-repo.key || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.jwt nginx:/etc/nginx/license.jwt || (( count++ > 5 )); do sleep 5; done
