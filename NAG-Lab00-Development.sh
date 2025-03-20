# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update Student Workstation host for the specific lab
# only if need a simpler /etc/hosts file do the following 2 steps
# curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nag/main/lab01/hosts
# sudo cp /tmp/hosts                                  /etc/hosts

# simple command to test and confirm this script is being run at launch.
touch /home/student/Desktop/hello.txt

# update nginx host for the specific lab
# NOTHING specific for this lab - only the common lab files from common-tasks.sh
