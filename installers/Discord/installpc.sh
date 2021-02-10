#!/bin/bash
dialog  --title "Powercord Setup" --infobox "Welcome. \n\nIf this is your first time running this script, download the Powercord repo by selecting option 1 first.\n\nAfterwards, select a function by typing the number that co-relates with the specific action you want to do." 10 70;sleep 5 
clear
cd
PS3='Powercord Setup: '
options=("Git Clone" "Update" "Install" "Uninstall" "Quit")
select choice in "${options[@]}"; do
    case $choice in
        "Git Clone")
            git clone https://github.com/powercord-org/powercord
	    # Downloads latest version of Powercord
            ;;
        "Update")
            cd powercord && git pull
            cd
	    # Updates Powercord to latest version
            ;;
        "Install")
            cd powercord && sudo npm run plug
            cd
	    # Injects mod into Canary
            ;;
        "Uninstall")
            cd powercord && sudo npm run unplug
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
