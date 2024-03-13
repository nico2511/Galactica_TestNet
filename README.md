# Galactica_TestNet

## Little toolbox to use a Galactica validator.
(for me export and import don't work perfectly, maybe a wrong variable)

Official guide : https://docs.galactica.com/galactica-developer-documentation/validator-guide
Unofficial Guide by crampon-viticole : https://ntemplate.notion.site/Installation-validateur-sur-infomaniak-Debian-24e983c33d2c4c51aad30947a20642da

### Before use, be sure to add those lines to your bashrc

```
nano ~/.bashrc
```

```
# set dir for data & configs
export MAIN_PATH_HOME=./
# set dir for configs, by default ~/.galactica
export MAIN_PATH_CONFIG=$MAIN_PATH_HOME/config
# set chain_id which we will join
export CHAIN_ID=galaandr_41238-41238
# that's how keys will be kept - in that case in a file and encrypted with a password
export KEYRING_BACKEND=file
# Wallet name
export KEY_NAME=ValidatorWallet
export VALIDATOR_MONIKER=cmaboite
#alias gala='galacticad --home /root/"$MAIN_PATH_HOME" --keyring-backend file --keyring-dir /root/"$MAIN_PATH_HOME"'
alias gala='galacticad --home $(realpath MAIN_PATH_HOME) --keyring-backend $KEYRING_BACKEND --keyring-dir $(realpath MAIN_PATH_HOME)'
```

And save 

### Erase the file if exist > download new one > and execute the file ;)
```
rm -f GnetMenu.sh && wget https://raw.githubusercontent.com/nico2511/Galactica_TestNet/main/GnetMenu.sh && chmod +x GnetMenu.sh && ./GnetMenu.sh
```

# Join us: https://discord.gg/WsrdXPxk
