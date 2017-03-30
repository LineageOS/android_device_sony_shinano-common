#!/system/bin/sh
CREDFOLDER=/data/credmgr

# simple error function
F_ERR(){
    ERR="$1"
    MSG="$2"
    if [ $ERR -ne 0 ];then
        system/bin/toybox echo "CREDINIT: $MSG failed!" >> /dev/kmsg
        exit $ERR
    else
	system/bin/toybox echo "CREDINIT: $MSG finished successfully" >> /dev/kmsg
    fi
}

# If credmgrd data doesn't match our
CREDMGRCNT=$(find $CREDFOLDER -group credmgr_client -type f -name "credmgr.db" | wc -l )

if [ "$CREDMGRCNT" == "0" ]; then
	# If /data/credmgr exist remove it
	/system/bin/logwrapper /system/bin/toybox echo "CREDINIT: Dont match"
	if [ -d "$CREDFOLDER" ]; then
		/system/bin/logwrapper /system/bin/toybox echo "CREDINIT: Drop old credmgrdata"
		/system/bin/mv -vf $CREDFOLDER $CREDFOLDER.old
	fi
	# Put binary into /cache
	/system/bin/logwrapper mkdir $CREDFOLDER
	F_ERR $? "mkdir $CREDFOLDER"
	/system/bin/logwrapper chown system:credmgr_client $CREDFOLDER
	F_ERR $? "chown $CREDFOLDER"
	/system/bin/logwrapper chcon u:object_r:credmgrd_data_file:s0 $CREDFOLDER
	F_ERR $? "chcon $CREDFOLDER"
	/system/bin/logwrapper /system/bin/toybox echo "CREDINIT: cp initial file"
	/system/bin/logwrapper cp -v /system/vendor/CredentialManagerData /cache/CredentialManagerData
	F_ERR $? "copy CredentialManagerData"
else
	F_ERR 0 "credmgr found already. no preparation required."
fi

# Tell init we are ready
/system/bin/setprop sys.credmgrdready true
F_ERR $? "setting property"
