### INSTALL GO
	mkdir solidityLab
	cd solidityLab
	sudo apt install -y curl
	sudo apt install -y build-essential
	sudo apt install -y screen
	curl -O https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.9.linux-amd64.tar.gz 

### CHECK GO VERSION	
	go version 
	// if it's installed properly
	rm go1.9.linux-amd64.tar.gz 

### BUILD ETHEREUM
	git clone https://github.com/ethereum/go-ethereum.git
	cd go-ethereum
	git checkout v1.6.7
	make geth



### CONNECT TO PRIVATE NETWORK

	geth --datadir "./bether" account new
	// Copy genesis.json and staticnodes.json into bether
	geth --datadir "." init genesis.json
	geth --rpc --rpcport "8000" --rpccorsdomain "*" --datadir "." --port "30303" --nodiscover --rpcapi "db,eth,net,web3,personal" --identity "one" --networkid 666 console
	// console will be opened
	net
	// you must see peerCount as "1"

### Web3 
	npm init
	npm	install	–save	body-parser
	npm	install	–save	ethereum.js
	npm	install	–save	express
	npm	install	–save	web3


### Browserify
	npm install -g browserify

