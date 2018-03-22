pragma solidity ^0.4.15;

// from ethereum smart contract 

contract mortal {
    /* Define variable owner of the type address */
    address owner;

    /* This function is executed at initialization and sets the owner of the contract */
    function mortal() { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() { if (msg.sender == owner) selfdestruct(owner); }
}

contract multiHello is mortal {
 
    mapping(bytes32 => string) messages;
    
 
    function addGreeter(bytes32 prefix, string msg) public {
        assert(bytes(messages[prefix]).length==0);
        messages[prefix] = "Merhaba";
    }


    function greet(bytes32 prefix) constant returns (string) {
        return messages[prefix];
    }
}