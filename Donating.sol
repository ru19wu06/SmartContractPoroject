pragma solidity ^0.5.0;
contract mortal {
    
    struct SugarDaddy{
        address donater; //贊助者的地址
        uint value;//贊助ETH數量
        string text;//乾爹留下的文字
        uint Num;//乾爹數量
    }
    uint count = 0;
    event Record(address,uint,string,uint);
    SugarDaddy[] public sugerdad;
    address payable public richest = 0xa77bd177A37DbCf25C4a23C8357372230e371e07 ;
    function pay(string memory ts) public payable returns(string memory){
         require(msg.value>0);
               
            if(msg.value>0.1 ether){
                 
                 
                richest.transfer(address(this).balance);
            
                sugerdad.push(SugarDaddy(msg.sender,msg.value,ts,count++));
                emit Record(msg.sender,msg.value,ts,count);
                return ("謝謝乾爹");
                   
            }else{
                sugerdad.push(SugarDaddy(msg.sender,msg.value,ts,count++));
                richest.transfer(address(this).balance);
                emit Record(msg.sender,msg.value,ts,count);
                return ("乾爹真小氣");
            }
               
    }
           
           
    function getDaddy() view public returns(uint){
        return sugerdad.length;//查詢有多少個乾爹
        
    }
    function getAddress() view public returns(address[] memory){//回傳所有贊助過的用戶
        address[] memory result = new address[](sugerdad.length);
        uint counter = 0;
        for(uint i=0;i<sugerdad.length;i++){
            result[counter] = sugerdad[counter].donater;
            counter++;
        }
       return result;
        
    }
    
    function setAddress(address payable ad) public {//設定收款錢包
        richest = ad;
    }
    
    
   
           
}
