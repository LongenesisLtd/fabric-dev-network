./network.sh down -ca -s couchdb
./network.sh up createChannel -ca -s couchdb -c channel5
./reload_contract.sh
