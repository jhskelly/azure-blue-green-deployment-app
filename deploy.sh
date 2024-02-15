#!/usr/bin/env bash

#./mvnw clean install
jar='./target/azure-blue-green-deployment-app-0.0.1-SNAPSHOT.jar'
app_name="blue-green-appservice"
rg='blue-green-rg'


az webapp deployment slot list --name "$app_name" --resource-group "$rg" --query [].name
az webapp deploy --name "$app_name" --resource-group "$rg" --type jar --src-path "$jar" --slot staging
az webapp deploy --name "$app_name" --resource-group "$rg" --type jar --src-path "$jar"



az webapp config appsettings set -g "$rg" -n "$app_name" --slot-settings  DATABASE="blue" --settings VERSION="Version1" SPRING_CACHE_NAME="blue"
az webapp config appsettings set -g "$rg" -n "$app_name" --slot staging --slot-settings DATABASE="green" --settings VERSION="Version2" SPRING_CACHE_NAME="green"


# Swap the slot
#az webapp deployment slot swap --resource-group  --name "$app_name" --slot staging --target-slot production --action preview


http https://blue-green-appservice.azurewebsites.net/static
http https://blue-green-appservice-staging.azurewebsites.net/static
