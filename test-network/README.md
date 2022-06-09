## Running the test network in docker containers

1) Make sure you have the prerequisites installed: https://hyperledger-fabric.readthedocs.io/en/latest/prereqs.html
2) curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh
3) ./install-fabric.sh docker binary
4) Clone https://github.com/LongenesisLtd/themis-smart-contract repo somewhere in your home directory
5) Change the test-network/reload_contract.sh script's configuration: PATH_TO_NETWORK=[path to current directory] PATH_TO_CODE=[path to themis-smart-contract directory]
6) Run ./test-network/reload_network.sh
7) After setup is done - Copy "connection-org1.yaml" from "test-network/organizations/peerOrganizations/org1.example.com" to "[themis-sdk-path]/connectionProfile.yaml"
8) To finalize connection: in the coppied connectionProfile.yaml change "peer0.org1.example.com" url to "grpcs://internal.docker.host:7051" and "ca.org1.example.com" url to 
"https://internal.docker.host:7054"
9) Optional: If want to see errors comming from the chaincode - run "./test-network/monitordocker.sh docker_test" in a separate terminal tab
