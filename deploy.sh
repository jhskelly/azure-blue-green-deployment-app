#!/usr/bin/env bash

#./mvnw clean install
jar='./target/azure-blue-green-deployment-app-0.0.1-SNAPSHOT.jar'
app_basic="blue-green-appservice"
app_properties="blue-green-app_properties-appservice"
rg='blue-green-rg'


az webapp deploy --name "$app_basic" --resource-group "$rg" --type jar --src-path "$jar" --slot staging
az webapp deploy --name "$app_basic" --resource-group "$rg" --type jar --src-path "$jar"

az webapp deploy --name "$app_properties" --resource-group "$rg" --type jar --src-path "$jar" --slot staging
az webapp deploy --name "$app_properties" --resource-group "$rg" --type jar --src-path "$jar"


az webapp config appsettings set -g "$rg" -n "$app_basic" --settings  VERSION="Version1"
az webapp config appsettings set -g "$rg" -n "$app_basic" --slot staging --settings  VERSION="Version2"


az webapp config appsettings set -g "$rg" -n "$app_properties" --slot-settings  DATABASE="blue" --settings VERSION="Version1" SPRING_CACHE_NAME="blue"
az webapp config appsettings set -g "$rg" -n "$app_properties" --slot staging --slot-settings DATABASE="green" --settings VERSION="Version2" SPRING_CACHE_NAME="green"

# Swap the slot
#az webapp deployment slot swap --resource-group  --name "$app_name" --slot staging --target-slot production --action preview
