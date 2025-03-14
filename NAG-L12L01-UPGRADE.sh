# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update lab environment
#Vickis test file to see if showing up on skillable lab system
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab12/VICKI-test-file.txt
sudo scp /tmp/VICKI-test-file.txt nginx:/home/student/

# install 30 day nginx one trial licenses from Salesforce - EXPIRES April 4, 2025
set +x
#original pathanme - if this works then delete the ones below without the "main" in the pathaname
#curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $LIC_TOKEN" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/EXPIRES-April-4-2025/nginx-one-eval.{crt,key,jwt}
#echo curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/EXPIRES-April-4-2025/nginx-one-eval.{crt,key,jwt}
#NOT sure if need main directory in pathname since these files are not showing up in my lab system
curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $LIC_TOKEN" https://raw.githubusercontent.com/learnf5/eval-reg-keys/nginx/EXPIRES-April-4-2025/nginx-one-eval.{crt,key,jwt}
echo curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" https://raw.githubusercontent.com/learnf5/eval-reg-keys/nginx/EXPIRES-April-4-2025/nginx-one-eval.{crt,key,jwt}
#set -x
until sudo scp /tmp/nginx-one-eval.crt nginx:/etc/ssl/nginx/nginx-repo.crt || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.key nginx:/etc/ssl/nginx/nginx-repo.key || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.jwt nginx:/etc/nginx/license.jwt || (( count++ > 5 )); do sleep 5; done
