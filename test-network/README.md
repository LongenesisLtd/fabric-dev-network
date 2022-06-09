## Running the test network in docker containers


1) Make sure you have the prerequisites installed: https://hyperledger-fabric.readthedocs.io/en/latest/prereqs.html
2) Switch to fabric-dev-network folder
3) curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh
4) ./install-fabric.sh docker binary

5) Switch to home directory (or any directory outside of this project)
6) Clone https://github.com/LongenesisLtd/themis-smart-contract repo somewhere in your home directory

7) Switch back to fabric-dev-network/fabric-network directory 
8) Change the reload_contract.sh script's configuration: PATH_TO_NETWORK="[path to test-network] PATH_TO_CODE=[path to themis-smart-contract directory]
9) Go to themis-smart-contract directory and run in "smart_contract" folder run "npm i" and "npm run build", then go back to the test network folder

[Before running reload_network.sh, make sure you kill any containers that use "docker_test" network, like monitoring containers or themis-sdk container]
10) Run ./reload_network.sh
[You have to repeat steps 11 and 12 it each time you run reload_network.sh]

11) After setup is done - Copy "connection-org1.yaml" from "organizations/peerOrganizations/org1.example.com" to "[themis-sdk-path]/connectionProfile.yaml"
12) To finalize connection: in the coppied connectionProfile.yaml change "peer0.org1.example.com" url to "grpcs://internal.docker.host:7051" and "ca.org1.example.com" url to 
"https://internal.docker.host:7054"

Optional: If want to see errors comming from the chaincode - run "./monitordocker.sh docker_test" in a separate terminal tab
