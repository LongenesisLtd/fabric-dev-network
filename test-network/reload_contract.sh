#!/bin/bash

PATH_TO_NETWORK="/Users/arnijs/fabric-samples/test-network"
PATH_TO_CODE="/Users/arnijs/themis-smart-contract/smart_contract"
SEQUENCE=1
export PATH=${PATH_TO_NETWORK}/../bin:$PATH
export FABRIC_CFG_PATH=$PATH_TO_NETWORK/../config/
cd $PATH_TO_CODE
peer lifecycle chaincode package themis.tar.gz --path . --lang node --label themis_0.0.1
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PATH_TO_NETWORK}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PATH_TO_NETWORK}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051
peer lifecycle chaincode install themis.tar.gz
PACKAGE_ID=$(peer lifecycle chaincode calculatepackageid themis.tar.gz)
peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID channel5 --name basic --version 1.0 --package-id $PACKAGE_ID --sequence $SEQUENCE --tls --cafile ${PATH_TO_NETWORK}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID channel5 --name basic --version 1.0 --sequence $SEQUENCE --tls --cafile ${PATH_TO_NETWORK}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --peerAddresses localhost:7051 --tlsRootCertFiles ${PATH_TO_NETWORK}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
