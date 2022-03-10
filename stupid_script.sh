#!/usr/bin/env bash
#set -x

#VARIABLES

iam_a_variable=1
count_process=$(ps aux | grep "bash ./stupid_script.sh" | grep -v grep | wc -l)
my_actual_PID=$(ps aux | grep "bash ./stupid_script.sh" | grep -v grep | head -1 | awk '{print $2}')
logfile_of_this_stupid_script=/tmp/stupid_script.log


#do not multiply process pleaaaaase !

if [ ${count_process} -gt 2 ]
then
        /usr/games/tchoutchou
        echo "Ahem ! Excuse me SIR this script is already started please stop this process : ${my_actual_PID}"
        echo "Bye Bye Baby !!"
        exit 10
fi


#Infinite LOOOOOOOOPP
while [ ${iam_a_variable} -lt 10 ]
do
        echo "$(date) : Stupid script is still running with this PID : ${my_actual_PID}" >> ${logfile_of_this_stupid_script}
        echo "****************STUPID SCRIPT IZ LAUNCHED************************"
        echo "Hiii LinuxPADAWAN"
        echo "If u wanna finish/wait me use kill SIG[KILL STOP TERM] PID command please ;)"
        echo "To help you this is my actual PID : ${my_actual_PID}"
        echo "****************************************"
        echo "...."
        sleep 5

done
