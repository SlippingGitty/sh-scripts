#!/bin/bash
dialog  --title "Vizality Setup Wizard" --infobox "Welcome. \n\nIf this is your first time running this script, download the Vizality repo by selecting option 1 first.\n\nAfterwards, select a function by typing the number that co-relates with the specific action you want to do." 10 70;sleep 5 
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Vizality Setup Wizard"
TITLE="Installer"
MENU="Select an option:"

OPTIONS=(1 "Git Clone"
         2 "Update"
         3 "Install"
         4 "Uninstall"
         5 "Quit")

while [ "$CHOICE -ne 4" ]; do
    CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
    case $CHOICE in
            1)  
                cd        
                git clone https://github.com/vizality/vizality
            # Downloads Vizality files
                ;;
            2)
                cd vizality && git pull
                cd
            # Updates Vizality to latest version
                ;;
            3)
                cd vizality && sudo npm run inject
                cd
            # Injects Vizality into Discord
                ;;
            4)
                cd vizality && sudo npm run uninject
                cd
            # Uninjects
                ;;
            5)
            echo "User requested exit"
            exit
                ;;
    esac
done