pragma solidity ^0.4.16;

contract classReservation{

address manager;
uint classCount;

struct Class{
    uint capacity;
    uint cost;
    bool isEmpty;    
    
}


struct Lecturer{
    string name;
    string lectName;
}


mapping(uint => Class) map_classes;
mapping(address => Lecturer) map_lecturers;
mapping(address => uint) balances;

// function addClass()
function addClass(uint _capacity, uint _cost ){
    require(msg.sender == manager);
    map_classes[classCount] = Class({capacity:_capacity, 
                            cost:_cost, isEmpty:true});
    classCount++;
    
}

// function queryClass()
function queryClass(uint index) public constant returns(bool){
    return map_classes[index].isEmpty;
}
//function reserveClass()

function reserveClass(uint index) payable returns(bool){
    require(bytes(map_lecturers[msg.sender].name).length>0);
    require(map_classes[index].cost<msg.value);
    require(queryClass(index));
    map_classes[index].isEmpty = false;
    return true;
}
// function addLecturer() 

function addLecturer(string name, string lectName, address lect_addr){
    require(msg.sender==manager);
    map_lecturers[lect_addr] = Lecturer({name:name , lectName:lectName});
}

function classReservation(){
    manager = msg.sender;   
    classCount=0;
}




}