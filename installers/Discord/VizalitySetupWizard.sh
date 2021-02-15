#!/bin/bash
#
#    ██╗   ██╗███████╗██╗    ██╗
#    ██║   ██║██╔════╝██║    ██║
#    ██║   ██║███████╗██║ █╗ ██║
#    ╚██╗ ██╔╝╚════██║██║███╗██║
#     ╚████╔╝ ███████║╚███╔███╔╝
#      ╚═══╝  ╚══════╝ ╚══╝╚══╝ 
#       VERSION 2021.02.15.01

#INITIAL INFO PROMPTS
dialog  --title "Vizality Setup Wizard" --infobox "Welcome. \n\nIf this is your first time running this script, download the Vizality repo by selecting option 1 first.\n\nAfterwards, select a function by typing the number that co-relates with the specific action you want to do." 10 70;sleep 5 
dialog --title  "READ THIS" --msgbox "Before injecting Vizality into your Discord client, please note that the dependencies must be installed first.\n\nAfter selecting Git Clone, please Install Dependencies, then Install." 10 60


#DIALOG/NCURSES
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Vizality Setup Wizard"
TITLE="Installer"
MENU="Select an option:"

while [ "$CHOICE -ne 4" ]; do
    CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

#OPTIONS NAMES
OPTIONS=(1 "Git Clone"
         2 "Update"
         3 "Install Dependencies"
         4 "Install"
         5 "Uninstall"
         6 "Quit")

#OPTIONS IN EXECUTION
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
                cd vizality && npm install --only=prod --legacy-peer-deps
                cd
            # Installs dependencies
                ;;
            4)
                cd vizality && sudo node src/inject inject --no-exit-codes 
                cd
            # Injects Vizality into Discord
                ;;
            5)
                cd vizality && sudo npm run uninject
                cd
            # Uninjects
                ;;
            6)
            echo "User requested exit"
            exit
                ;;
    esac
done
