#!/bin/bash

ans="/var/log/rsync/webserv/output"`date +"%Y%m%d"`

function chkproc {
        if [ $1 -eq 0 ]; then
                echo "Process on $2 OK"
        else
                echo "Process on $2 !!FAIL!!"
        fi
}

for i in `cat /root/listip`
do
        #echo " " >> $ans
        echo "********** START **********" >> $ans
        echo "Starting On "$i" at "`date +"%Y%m%d-%T"` >> $ans
        if [ "$1" == "doit" ]; then
                echo "Processing"
                /usr/bin/rsync -avhze "ssh -q" --progress --delete-after --timeout=60 /var/www/html/bikefordad/ root@$i:/var/www/html/bikefordad/ >> $ans
                res=`chkproc $? $i`
                echo $res >> $ans
                echo $res
                echo "********** END **********" >> $ans
                echo " " >> $ans

        else
                echo "Simulate Run"
                /usr/bin/rsync -anvhe "ssh -q" --progress --delete-after --timeout=10 /var/www/html/bikefordad/ root@$i:/var/www/html/bikefordad/ >> $ans
                res=`chkproc $? $i`
                echo $res >> $ans
                echo $res
                echo "********** END **********" >> $ans
                echo " " >> $ans
        fi

done
