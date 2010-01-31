#!/sbin/sh
#
# Backup and restore proprietary Android system files
# Edited script from cyanogenmod rom


CACHE=/cache

backup_file() {
    if [ -e "$1" ];
    then
        if [ "$2" != "" ];
        then
            echo "$2  $1" | md5sum -c -
            if [ $? -ne 0 ];
            then
                echo "MD5Sum check for $1 failed!";
                exit $?;
            fi
        fi
        cp $1 $CACHE/`basename $1`
    fi
}

restore_file() {
    FILE=`basename $1`
    DIR=`dirname $1`
    if [ -e "$CACHE/$FILE" ];
    then
        if [ ! -d "$DIR" ];
        then
            mkdir -p $DIR;
        fi
        cp -p $CACHE/$FILE $1;
        if [ "$2" != "" ];
        then
            rm $2;
        fi
    fi
}

case "$1" in
    backup)
        mount /system
        mount /cache
        mount /data
        
        backup_file /system/app/HtcCopyright.apk
        backup_file /system/app/CarDock.apk
        backup_file /system/app/Vending.apk
        backup_file /system/app/gtalkservice.apk
        backup_file /system/app/VoiceSearchWithKeyboard.apk
        backup_file /system/app/GoogleCheckin.apk
        backup_file /system/app/GenieWidget.apk
        backup_file /system/app/GoogleApps.apk
        backup_file /system/app/Facebook.apk
        backup_file /data/app/Facebook.apk
        backup_file /system/app/GoogleSubscribedFeedsProvider.apk
        backup_file /system/app/GoogleContactsSyncAdapter.apk
        backup_file /system/app/MarketUpdater.apk
        backup_file /system/app/BugReport.apk
        backup_file /system/app/YouTube.apk
        backup_file /data/app/Maps.apk
        backup_file /system/app/Maps.apk
        backup_file /system/app/GoogleBackupTransport.apk
        backup_file /system/app/Gmail.apk
        backup_file /system/app/EnhancedGoogleSearchProvider.apk
        backup_file /system/app/GmailProvider.apk
        backup_file /system/app/com.amazon.mp3.apk
        backup_file /data/app/com.amazon.mp3.apk
        backup_file /system/app/NetworkLocation.apk
        backup_file /system/app/Street.apk
        backup_file /system/app/Talk.apk
        backup_file /system/app/TalkProvider.apk
        backup_file /system/app/googlevoice.apk
        backup_file /data/app/googlevoice.apk
        backup_file /system/app/LatinImeTutorial.apk
        backup_file /system/app/SetupWizard.apk
        backup_file /system/app/GooglePartnerSetup.apk
        backup_file /system/app/MediaUploader.apk
        backup_file /system/app/PassionQuickOffice.apk
        backup_file /system/app/GoogleSettingsProvider.apk
        backup_file /system/etc/permissions/com.google.android.gtalkservice.xml
        backup_file /system/etc/permissions/com.google.android.maps.xml
        backup_file /system/etc/permissions/com.google.android.datamessaging.xml
        backup_file /system/framework/com.google.android.gtalkservice.jar
        backup_file /system/framework/com.google.android.maps.jar
        backup_file /system/lib/libgtalk_jni.so
        backup_file /system/lib/libspeech.so
        ;;
    restore)
        restore_file /system/app/HtcCopyright.apk
        restore_file /system/app/CarDock.apk
        restore_file /system/app/Vending.apk
        restore_file /system/app/gtalkservice.apk
        restore_file /system/app/VoiceSearchWithKeyboard.apk
        restore_file /system/app/GoogleCheckin.apk
        restore_file /system/app/GenieWidget.apk
        restore_file /system/app/GoogleApps.apk
        restore_file /data/app/Facebook.apk
        restore_file /system/app/GoogleSubscribedFeedsProvider.apk
        restore_file /system/app/GoogleContactsSyncAdapter.apk
        restore_file /system/app/MarketUpdater.apk
        restore_file /system/app/BugReport.apk
        restore_file /system/app/YouTube.apk
        restore_file /data/app/Maps.apk
        restore_file /system/app/GoogleBackupTransport.apk
        restore_file /system/app/Gmail.apk
        restore_file /system/app/EnhancedGoogleSearchProvider.apk
        restore_file /system/app/GmailProvider.apk
        restore_file /data/app/com.amazon.mp3.apk
        restore_file /system/app/NetworkLocation.apk
        restore_file /system/app/Street.apk
        restore_file /system/app/Talk.apk
        restore_file /system/app/TalkProvider.apk
        restore_file /data/app/googlevoice.apk
        restore_file /system/app/LatinImeTutorial.apk
        restore_file /system/app/SetupWizard.apk
        restore_file /system/app/GooglePartnerSetup.apk
        restore_file /system/app/MediaUploader.apk
        restore_file /system/app/PassionQuickOffice.apk
        restore_file /system/app/GoogleSettingsProvider.apk
        restore_file /system/etc/permissions/com.google.android.gtalkservice.xml
        restore_file /system/etc/permissions/com.google.android.maps.xml
        restore_file /system/framework/com.google.android.gtalkservice.jar
        restore_file /system/framework/com.google.android.maps.jar
        restore_file /system/etc/permissions/com.google.android.datamessaging.xml
        restore_file /system/lib/libgtalk_jni.so
        restore_file /system/lib/libspeech.so
        ;;
    *) 
        echo "Usage: $0 {backup|restore}"
        exit 1
esac

exit 0
