#!/system/bin/sh
CREDFOLDER=/data/credmgr

# If credmgrd data doesn't match our

if [ $(find $CREDFOLDER -group credmgr_client -type f -name "credmgr.db" | wc -l ) -eq 0 ]; then
	# If /data/credmgr exist remove it
	/system/bin/logwrapper /system/bin/toybox echo "CREDINIT: Dont match"
	if [ -d "$CREDFOLDER" ]; then
		/system/bin/logwrapper /system/bin/toybox echo "CREDINIT: Drop old credmgrdata"
		/system/bin/mv -vf $CREDFOLDER $CREDFOLDER.old
	fi
	# Put binary into /cache
	/system/bin/logwrapper mkdir $CREDFOLDER
	/system/bin/logwrapper chown system:credmgr_client $CREDFOLDER
	/system/bin/logwrapper chcon u:object_r:credmgrd_data_file:s0 $CREDFOLDER
	/system/bin/logwrapper /system/bin/toybox echo "CREDINIT: cp initial file"
	/system/bin/logwrapper cp -v /system/vendor/CredentialManagerData /cache/CredentialManagerData
fi

if [ $? -eq 0 ]; then
	# Tell init we are ready
	/system/bin/setprop sys.credmgrdready true
else
	/system/bin/toybox echo "CREDINIT: Something goes wrong at credmgrd init!"
fi

