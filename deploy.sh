#!/usr/bin/env bash

./mvnw clean install
jar='./target/azure-blue-green-deployment-app-0.0.1-SNAPSHOT.jar'
app_name="blue-green-appservice"
rg='blue-green-rg'


az webapp deployment slot list --name "$app_name" --resource-group "$rg" --query [].name
az webapp deployment source config-zip --src "$jar" --name "$app_name" --resource-group $rg --slot staging

# Swap the slot
#az webapp deployment slot swap --resource-group  --name "$app_name" --slot staging --target-slot production --action preview
