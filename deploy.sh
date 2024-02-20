#!/usr/bin/env bash

#./mvnw clean install
. ./config.sh

# Set the config for the application
az webapp config appsettings set -g "$rg" -n "$app_basic" --settings  VERSION="Version1"
az webapp config appsettings set -g "$rg" -n "$app_basic" --slot staging --settings  VERSION="Version2"

az webapp config appsettings set -g "$rg" -n "$app_properties" --slot-settings  DATABASE="blue" --settings VERSION="Version1" RESOURCES="InMemory"
az webapp config appsettings set -g "$rg" -n "$app_properties" --slot staging --slot-settings DATABASE="green" --settings VERSION="Version2" RESOURCES="Production"


# Deploy the application
az webapp deploy --name "$app_basic" --resource-group "$rg" --type jar --src-path "$jar" --slot staging
az webapp deploy --name "$app_basic" --resource-group "$rg" --type jar --src-path "$jar"

az webapp deploy --name "$app_properties" --resource-group "$rg" --type jar --src-path "$jar" --slot staging
az webapp deploy --name "$app_properties" --resource-group "$rg" --type jar --src-path "$jar"

# Swap the slot
#az webapp deployment slot swap --resource-group  --name "$app_name" --slot staging --target-slot production --action preview
