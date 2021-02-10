#!/bin/bash
PS3='Powercord Setup: '
options=("Git Clone" "Install" "Uninstall" "Quit")
select choice in "${options[@]}"; do
    case $choice in
        "Git Clone")
            git clone https://github.com/powercord-org/powercord
	    # Downloads Powercord files
            ;;
        "Install")
            cd powercord && sudo npm run plug 
	    # Injects mod into Canary
            ;;
        "Uninstall")
            cd powercord && sudo npm run unplug
	    # Uninjects mod
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
