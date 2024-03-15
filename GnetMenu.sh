#!/bin/bash
#bash -c "$(wget -qLO - https://raw.githubusercontent.com/nico2511/Galactica_TestNet/main/GnetMenu.sh)"
# D�finition des couleurs
ORANGE=$(tput setaf 3)
BLANC_BG=$(tput setab 7)
GRAS=$(tput bold)
RESET=$(tput sgr0)

echo "



 ██████╗  █████╗ ██╗      █████╗  ██████╗████████╗██╗ ██████╗ █████╗ 
██╔════╝ ██╔══██╗██║     ██╔══██╗██╔════╝╚══██╔══╝██║██╔════╝██╔══██╗
██║  ███╗███████║██║     ███████║██║        ██║   ██║██║     ███████║
██║   ██║██╔══██║██║     ██╔══██║██║        ██║   ██║██║     ██╔══██║
╚██████╔╝██║  ██║███████╗██║  ██║╚██████╗   ██║   ██║╚██████╗██║  ██║
 ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝╚═╝  ╚═╝
                                                                     
                                                                    
                                                                     
████████╗ ██████╗  ██████╗ ██╗     ██████╗  ██████╗ ██╗  ██╗         
╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔══██╗██╔═══██╗╚██╗██╔╝         
   ██║   ██║   ██║██║   ██║██║     ██████╔╝██║   ██║ ╚███╔╝          
   ██║   ██║   ██║██║   ██║██║     ██╔══██╗██║   ██║ ██╔██╗          
   ██║   ╚██████╔╝╚██████╔╝███████╗██████╔╝╚██████╔╝██╔╝ ██╗         
   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝         
                                                                     
                                                                            
 "
echo "Official guide : https://docs.galactica.com/galactica-developer-documentation/validator-guide"

echo "Unofficial Guide by crampon-viticole : https://ntemplate.notion.site/Galactica-com-84475ec1f70a409b94c9d7acd55cc47d"

echo " Video tutorial by crampon-viticole : https://www.youtube.com/watch?v=zgJ8E1JvTWU"

options=(
    "${ORANGE}${GRAS}CREATE A WALLET${RESET}"
    "${ORANGE}${GRAS}WALLET ADDRESS${RESET}"
    "${ORANGE}${GRAS}VALIDATOR ADRESS${RESET}"
    "${ORANGE}${GRAS}START VALIDATOR${RESET}"
    "${ORANGE}${GRAS}EXPORT WALLET${RESET}"
    "${ORANGE}${GRAS}IMPORT WALLET${RESET}"
    "${ORANGE}${GRAS}SHOW GO VERSION${RESET}"  
    "${ORANGE}${GRAS}SHOW GALACTICA VALIDATOR VERSION${RESET}"
    "${ORANGE}${GRAS}DOWNLOAD GENESIS FILE${RESET}"
    "${ORANGE}${GRAS}UPDATE SERVER${RESET}"     
) 
PS3="Enter a number (1-5): "

select option in "${options[@]}"; do

  case "$REPLY" in
    1) 
        if [[ $option ]]; then
            galacticad keys add "$KEY_NAME" --algo eth_secp256k1 --home "$MAIN_PATH_HOME" --keyring-backend "$KEYRING_BACKEND" --keyring-dir "$MAIN_PATH_HOME"
        else
            echo "Option no valid."
        fi
        ;;

    2) 
        if [[ $option ]]; then
            galacticad keys show "$KEY_NAME" -a --keyring-backend file --keyring-dir "$MAIN_PATH_HOME"
        else
            echo "Option no valid."
        fi
        ;;
    3) 
        if [[ $option ]]; then
            galacticad keys show "$KEY_NAME" --bech val --keyring-backend file --keyring-dir "$MAIN_PATH_HOME"
        else
            echo "Option no valid."
        fi
        ;;
    4) 
        if [[ $option ]]; then
            galacticad start --home="$(realpath "$MAIN_PATH_HOME")" --chain-id="$CHAIN_ID" --keyring-backend=file --pruning=nothing --metrics --rpc.unsafe --log_level=info --json-rpc.enable=true --json-rpc.enable-indexer=true --json-rpc.api=eth,txpool,personal,net,debug,web3 --api.enable
            break
        else
            echo "Option no valid."
        fi
        ;;
    5)
        if [[ $option ]]; then
            
            galacticad --home ~/.galacticad keys export $value > "$MAIN_PATH_HOME"/exported_key # from the official doc and donc work for me          
            #galacticad --home ~/keyring-file keys export "$KEY_NAME" > "$MAIN_PATH_HOME"/exported_key # In my case this commande work well
        else
            echo "Option no valid."
        fi
        ;;
    6)
        if [[ $option ]]; then          
            galacticad --keyring-backend file --home="$MAIN_PATH_HOME" keys import "$KEY_NAME" exported_key

        else
            echo "Option no valid."
        fi
        ;;
            7)
        if [[ $option ]]; then          
            go version

        else
            echo "Option no valid."
        fi
        ;;
            8)
        if [[ $option ]]; then          
            galacticad version --long

        else
            echo "Option no valid."
        fi
        ;;
                    9)
        if [[ $option ]]; then          
            echo "File not already avalaible at the moment"

        else
            echo "Option no valid."
        fi
        ;;

                            10)
        if [[ $option ]]; then          
            sudo apt update -y && apt upgrade -y

        else
            echo "Option no valid."
        fi
        ;;
    *)
        echo "Option no valid."
        ;;
  esac
done
