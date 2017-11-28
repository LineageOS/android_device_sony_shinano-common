#!/system/vendor/bin/sh
CREDFOLDER=/data/credmgr
LOG=/cache/credmgr.log

# start new log file
echo -e "\n*********************************\n$(date) - $0 started" > $LOG

# simple error function writing to kernel buffer and logfile
F_ERR(){
    ERR="$1"
    MSG="$2"
    if [ $ERR -ne 0 ];then
        echo "CREDINIT: $MSG failed!" >> $LOG
        exit $ERR
    else
	echo "CREDINIT: $MSG finished successfully" >> $LOG
    fi
}

# If credmgrd data doesn't match our
CREDMGRCNT=$(find $CREDFOLDER -group system -type f -name "credmgr.db" | wc -l )

echo -e "credmgr folder:\n$(ls -la $CREDFOLDER)\ncredmgr match (if any):" >> $LOG
find $CREDFOLDER -group system -type f -name "credmgr.db" >> $LOG


if [ "x$CREDMGRCNT" == "x0" ]; then
	# If /data/credmgr exist remove it
	echo "CREDINIT: Dont match"
	if [ -d "$CREDFOLDER" ]; then
		echo "CREDINIT: Drop old credmgrdata"
		mv -vf $CREDFOLDER ${CREDFOLDER}.$(date +"%Y-%m-%d")  >> $LOG 2>&1
	fi
	# Put binary into /cache
	mkdir $CREDFOLDER >> $LOG 2>&1
	F_ERR $? "mkdir $CREDFOLDER"
	# Set perms on folder
	chown system:system $CREDFOLDER >> $LOG 2>&1
	F_ERR $? "chown $CREDFOLDER"
	chmod 770 $CREDFOLDER >> $LOG 2>&1
	F_ERR $? "chmod 770"
	chcon u:object_r:credmgrd_data_file:s0 $CREDFOLDER >> $LOG 2>&1
	F_ERR $? "chcon $CREDFOLDER"
	echo "CREDINIT: cp initial file" >> $LOG 2>&1
	cp -v /system/vendor/CredentialManagerData /cache/CredentialManagerData >> $LOG 2>&1
	F_ERR $? "copy CredentialManagerData"
	chown system:system /cache/CredentialManagerData >> $LOG 2>&1
	F_ERR $? "chown CredentialManagerData"
else
	F_ERR 0 "credmgr found already. no preparation required."
fi

# Tell init we are ready
setprop sys.credmgrdready true
F_ERR $? "setting property"
