#!/system/bin/sh
#########################################################################
#	used for start android service
#########################################################################
echo "MeidService "
meid_service=`getprop persist.sys.start.meidservice`
meid_set=`getprop persist.sys.meid.set`

if [ "$meid_service" == "1" ]
then
    echo "am startservice MeidService if persist.sys.start.meidservice = 1"
    pm clear com.huaqin.meidservice
    am startservice -n com.huaqin.meidservice\/.MeidService
    setprop persist.sys.start.meidservice 0
    if [ "$meid_set" == "1" ]
    then
        sleep 5
        echo "rebooting ..."
        reboot
    fi
fi
