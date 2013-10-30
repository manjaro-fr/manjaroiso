## Simple bash script to install the necessary software packages to
## enable printing capabilities. CUPs service is then enabled and
## started.
##
## Written by Carl Duff
##

clear
echo "Checking root privilages and internet connection...."
echo

## Check 1: Ensure that the script is being run with root privilages

if  [[ `whoami` != "root" ]]; 
then
  echo "You must run this script with root privilages (sudo or gksu commands)."
  echo "press <enter> to close the terminal."
  read pause
  exit
fi

## Check 2: Ensure that there is an active internet connection

if ! [ "`ping -c 1 google.com`" ]; 
then
  echo 
  echo "Connection test failed. You must run this script with an active internet"
  echo "connection. Press <enter> to close this terminal."
  read pause
  exit
fi

# Information about this script for the user

clear

echo
echo "Install and enable full printing capabilities"
echo
echo "This will install all the necessary software to enable printing"
echo "capabilities. You will then be able to connect and set-up your printer" 
echo "straight away."
echo 
echo "Note that this process may be interrupted by an essential system upgrade. If"
echo "this happens, perform the upgrade and then run this process again."
echo 
echo "Press <enter> to proceed. You may still cancel the process when prompted."
read pause

  pacman -Syy manjaro-printer && systemctl enable cups.service && systemctl start cups.service
  echo
  echo "Process Complete. Press <enter> to continue"
  read pause
  echo

esac

exit 0