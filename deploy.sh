#!/usr/bin/env bash

#./mvnw clean install
. ./config.sh

# Set the config for the application
az webapp config appsettings set -g "$rg" -n "$app_basic" --settings  VERSION="Chicago" VERSION_COLOUR="blue"
az webapp config appsettings set -g "$rg" -n "$app_basic" --slot staging --settings  VERSION="Detroit" VERSION_COLOUR="green"

az webapp config appsettings set -g "$rg" -n "$app_properties" --slot-settings  RESOURCES="Production"  --settings VERSION="Chicago" VERSION_COLOUR="blue"
az webapp config appsettings set -g "$rg" -n "$app_properties" --slot staging --slot-settings RESOURCES="InMemory" --settings VERSION="Detroit" VERSION_COLOUR="green"


# Deploy the application
az webapp deploy --name "$app_basic" --resource-group "$rg" --type jar --src-path "$jar" --slot staging
az webapp deploy --name "$app_basic" --resource-group "$rg" --type jar --src-path "$jar"

az webapp deploy --name "$app_properties" --resource-group "$rg" --type jar --src-path "$jar" --slot staging
az webapp deploy --name "$app_properties" --resource-group "$rg" --type jar --src-path "$jar"

# Swap the slot
#az webapp deployment slot swap --resource-group  --name "$app_name" --slot staging --target-slot production --action preview
