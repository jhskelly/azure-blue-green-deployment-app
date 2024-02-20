#!/usr/bin/env bash
. ./config.sh


# Swap the slot
az webapp deployment slot swap --resource-group "$rg"   --name "$app_properties" --slot staging --target-slot production
