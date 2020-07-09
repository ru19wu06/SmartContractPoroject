pragma solidity ^0.4.24;

contract Factory {
    address[] public newContracts;

    function createContract(string name,address ms) public {
        address newContract = new Contract(name,msg.sender);
        newContracts.push(newContract);
    } 
    
    function createContract2(address ins) public {
        address newContract2 = new DonateToCreator(ins);
        newContracts.push(newContract2);
    } 
    
    
}

contract Contract {
    string public Name;
    address getMoney;
    event SugarDady(address name,uint donation,string la);
    
    constructor (string _name,address de) public {
        Name = _name;
        getMoney = de;
    }
    
    function Donate(string later) public payable{
        require(msg.value>0.01 ether);
        emit SugarDady(msg.sender,msg.value,later);
        getMoney.transfer(msg.value);
        
    }
}

contract DonateToCreator{
    address user;
    constructor (address ins){
        user = ins;
    }
    
    
    function Donate() public payable{
        user.transfer(msg.value);
        
    }
    
}

