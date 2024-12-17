#!/bin/sh
export VAULT_ADDR='http://vaulthost:8300'
export VAULT_TOKEN='00000000-0000-0000-0000-000000000000'

# Vent på Vault
until curl -s "$VAULT_ADDR/v1/sys/health" | grep '"initialized":true'; do
  echo "Waiting for Vault to be ready..."
  sleep 5
done

# Indsæt secrets
vault kv put -mount secret Secrets jwtSecret=hsduehjrebxbbjklwxp39948788akkkkedlpahheb156512989736363yggs jwtIssuer=AuctionGO

# Hold containeren kørende
while :
do
  sleep 3600
done
