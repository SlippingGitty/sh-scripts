#!/bin/bash
dialog  --title "Vizality Setup" --infobox "Welcome. \n\nIf this is your first time running this script, download the Vizality repo by selecting option 1 first.\n\nAfterwards, select a function by typing the number that co-relates with the specific action you want to do." 10 70;sleep 5 
clear
cd
PS3='Vizality Setup: '
options=("Git Clone" "Update" "Install" "Uninstall" "Quit")
select choice in "${options[@]}"; do
    case $choice in
        "Git Clone")
            git clone https://github.com/Vizality/Vizality
	    # Downloads latest version of Vizality
            ;;
        "Update")
            cd vizality && git pull
            cd
	    # Updates vizality to latest version
            ;;
        "Install")
            cd vizality && sudo npm run inject
            cd
	    # Injects mod into Discord
            ;;
        "Uninstall")
            cd vizality && sudo npm run uninject
            cd
	    # Uninjects mod
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
