bv="brew -v"
wv="wine64 --version"
htr='open the exe file by clicking it twice then a window will pop up saying "run directly or package app".'
AppName="Photoshop2020edition"
HTE="Press enter to exit."
ExitError()
{
  echo "There was an error."
  read -p ""
}
clear
echo "if you are on macos catilina then You need to give the terminal.app the “Full Disk Access” to prevent any file creation failure later. Go to “System Preferences” >> Security & Privacy >> “Privacy” tab >> click on “Full Disk Access” >> now click on padlock icon on the left bottom  to unlock it >> enter your mac password >> now click on “+” to add an app then add the terminal.app which can be found in “Applications/Utilities”."
read -p "When finished please type yes. " fda
clear
echo "I will now install the required apps to run this program."
sleep 2
echo "To install this app please enter your password" && sudo spctl --master-disable
if [ "$?" != "0" ]; then
    echo '[Error] Unable to run "sudo spctl --master-disable"' 1>&2
    exit 1
    ExitError
fi
sudo xcode-select --install
if [ "$?" != "0" ]; then
    echo "[Error] " 1>&2
    exit 1
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
if [ "$?" != "0" ]; then
    echo '[Error] Unable to Download "Homebrew/install/master/install.sh"' 1>&2
    exit 1
    ExitError
fi
echo "Brew Version: $bv" && sleep 2
brew sudo cask install xquartz
if [ "$?" != "0" ]; then
    echo '[Error] Unable to Install "xquartz"' 1>&2
    exit 1
    ExitError
fi
echo "Installing Wine" && brew cask install homebrew/cask-versions/wine-devel
if [ "$?" != "0" ]; then
    echo '[Error] Unable to install "homebrew/cask-versions/wine-devel"' 1>&2
    exit 1
    ExitError
fi
echo "Wine Version: $wv"
echo "To run $AppName $HTR"
echo "$HTE"
read -p ""
