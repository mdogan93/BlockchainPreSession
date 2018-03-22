pragma solidity ^0.4.15;


contract mortal {
    
    address owner;

    /* This function is executed at initialization and sets the owner of the contract */
    function mortal() { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() { if (msg.sender == owner) selfdestruct(owner); }
}

contract payToWin is mortal {
  
    mapping(address=>uint) balances;
    uint playCount;
    uint startBlock;
    uint prizePool;
    function payToWin(){
        playCount=0;
        startBlock = block.number;
        prizePool = 0 ether;
        
    }
    
    function getStartBlock() constant public returns(uint){
        return startBlock;
    }
    
    function getcurrBlock() constant public returns(uint){
        return block.number;
    }
    
    function deposit() public payable returns(uint) {
        require(msg.value>= 1 ether);
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]);
        balances[msg.sender] += msg.value;

        return balances[msg.sender];
    }
    
    function play() public constant returns(bytes32, uint){
        require(balances[msg.sender]>=1 ether);
        bytes32 message = "Lost : ";
        playCount+=1;
        prizePool+= 1 ether;
        balances[msg.sender]-= 1 ether;
        if(checkWinner(msg.sender)){
            prizePool = 0 ;
            balances[msg.sender]+= prizePool;
            message = "Win : ";
        }
        return (message, balances[msg.sender]);
    }
    
    function checkWinner(address addr) public returns(bool){
        return( (getcurrBlock() - getStartBlock())%2 == 0 && playCount % 5 == 0 );
         
    }
    
    function checkPrizePool() constant public returns(uint){
        return prizePool;
    }
    function withdraw(uint amount) constant public returns(uint) {
        require(amount <= balances[msg.sender]);
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return balances[msg.sender];
    }
    
    function balance() constant public returns (uint) {
        return balances[msg.sender];
    }
    
    
    

}