#!/bin/bash
cd $HOME
PS3='Vizality Setup: '
options=("Git Clone" "Install" "Uninstall" "Quit")
select choice in "${options[@]}"; do
    case $choice in
        "Git Clone")
            git clone https://github.com/vizality/vizality
	    # Git clones Vizality
            ;;
        "Install")
            cd vizality && sudo npm run inject 
	    # Injects mod into Discord
            ;;
        "Uninstall")
            cd vizality && sudo npm run uninject
	    # Uninjects mod
	    break
            ;;
	"Quit")
	    echo "User requested exit"
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
