#!/bin/bash
set -e

echo "🚀 Deploying HelloBase to Base Sepolia..."
source .env

forge script script/Deploy.s.sol:DeployScript \
  --rpc-url "$BASE_SEPOLIA_RPC_URL" \
  --broadcast \
  --legacy
