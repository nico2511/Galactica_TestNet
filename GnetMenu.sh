#!/bin/bash

# Définition des couleurs
ORANGE=$(tput setaf 3)
BLANC_BG=$(tput setab 7)
GRAS=$(tput bold)
RESET=$(tput sgr0)

echo "

   _____            _                 _____  _______  _____  _____           
  / ____|    /\    | |         /\    / ____||__   __||_   _|/ ____|    /\    
 | |  __    /  \   | |        /  \  | |        | |     | | | |        /  \   
 | | |_ |  / /\ \  | |       / /\ \ | |        | |     | | | |       / /\ \  
 | |__| | / ____ \ | |____  / ____ \| |____    | |    _| |_| |____  / ____ \ 
  \_____|/_/    \_\|______|/_/    \_\\_____|   |_|   |_____|\_____|/_/    \_\

  TOOLBOX :]
                                                                             
                                                                             
 "

options=(
    "${ORANGE}${GRAS}CREER UN WALLET${RESET}"
    "${ORANGE}${GRAS}ADRESSE  DU  WALLET${RESET}"
    "${ORANGE}${GRAS}ADRESSE DU VALIDATEUR${RESET}"
    "${ORANGE}${GRAS}DEMARRER LE VALIDATEUR${RESET}"
    "${ORANGE}${GRAS}EXPORTER LE WALLET${RESET}"
    "${ORANGE}${GRAS}IMPORTER LE WALLET${RESET}"   
) 
PS3="Enter a number (1-5): "

select option in "${options[@]}"; do

  case "$REPLY" in
    1) 
        if [[ $option ]]; then
            galacticad keys add $KEY_NAME --algo eth_secp256k1 --home $MAIN_PATH_HOME --keyring-backend $KEYRING_BACKEND --keyring-dir $MAIN_PATH_HOME
        else
            echo "Option non valide."
        fi
        ;;

    2) 
        if [[ $option ]]; then
            galacticad keys show "$KEY_NAME" -a --keyring-backend file --keyring-dir "$MAIN_PATH_HOME"
        else
            echo "Option non valide."
        fi
        ;;
    3) 
        if [[ $option ]]; then
            galacticad keys show "$KEY_NAME" --bech val --keyring-backend file --keyring-dir "$MAIN_PATH_HOME"
        else
            echo "Option non valide."
        fi
        ;;
    4) 
        if [[ $option ]]; then
            galacticad start --home="$(realpath "$MAIN_PATH_HOME")" --chain-id="$CHAIN_ID" --keyring-backend=file --pruning=nothing --metrics --rpc.unsafe --log_level=info --json-rpc.enable=true --json-rpc.enable-indexer=true --json-rpc.api=eth,txpool,personal,net,debug,web3 --api.enable
            break
        else
            echo "Option non valide."
        fi
        ;;
    5)
        if [[ $option ]]; then
            read -p "Veuillez entrer le nom du wallet à exporter: " value
            echo "Vous avez saisi: $value"
            galacticad --home ~/.galacticad keys export $value > $MAIN_PATH_HOME/exported_key
        else
            echo "Option non valide."
        fi
        ;;
    6)
        if [[ $option ]]; then
            read -p "Veuillez entrer le nom du wallet à importer: " value
            echo "Vous avez saisi: $value"
            galacticad --keyring-backend file --home=$MAIN_PATH_HOME keys import $value exported_key

        else
            echo "Option non valide."
        fi
        ;;
    *)
        echo "Option non valide."
        ;;
  esac
done
