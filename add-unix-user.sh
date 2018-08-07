#!/bin/bash
echo "Please use this script in conjunction with PAM to enforce password policy"
echo ""
echo "Please Enter the New User Username:"
read NEWUSER
NEWUSER=`echo "$NEWUSER" | awk '{print tolower($0)}'`
echo "Please Enter Temporary Password for New User:"
read TEMPPASS
sudo useradd -s /bin/bash -m "$NEWUSER"
echo "$NEWUSER:$TEMPPASS" | sudo chpasswd
sudo chage -d 0 $NEWUSER
sudo chmod 740 /home/$NEWUSER
isADMINFUN () {
echo "Is "$NEWUSER" an Administrator y/n?"
read isADMIN
isADMIN=`echo "$isADMIN" | awk '{print tolower($0)}'`
adminFunction
}
adminFunction () {
if [ "$isADMIN" == "y" ]; then
        sudo usermod -aG sudo $NEWUSER
        exit 0
elif [ "$isADMIN" == "n" ]; then
        echo "What group should "$NEWUSER" be apart of?"
        read GROUP
        sudo usermod -aG $GROUP $NEWUSER
        exit 0
else
        echo "Please enter either y or n"
        isADMINFUN
fi
}
isADMINFUN