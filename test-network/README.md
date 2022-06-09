## Running the test network in docker containers

[Assuming work is done in this folder]

1) Make sure you have the prerequisites installed: https://hyperledger-fabric.readthedocs.io/en/latest/prereqs.html
2) curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh
3) ./install-fabric.sh docker binary
4) Clone https://github.com/LongenesisLtd/themis-smart-contract repo somewhere in your home directory
5) Change the reload_contract.sh script's configuration: PATH_TO_NETWORK="[path to test-network] PATH_TO_CODE=[path to themis-smart-contract directory]
6) Go to themis-smart-contract directory and run in "smart_contract" folder run "npm i" and "npm run build", then go back to the test network folder 
7) Run ./reload_network.sh
8) After setup is done - Copy "connection-org1.yaml" from "organizations/peerOrganizations/org1.example.com" to "[themis-sdk-path]/connectionProfile.yaml"
9) To finalize connection: in the coppied connectionProfile.yaml change "peer0.org1.example.com" url to "grpcs://internal.docker.host:7051" and "ca.org1.example.com" url to 
"https://internal.docker.host:7054"
10) Optional: If want to see errors comming from the chaincode - run "./monitordocker.sh docker_test" in a separate terminal tab
