pragma solidity ^0.5.0; //^version indicated or higher
contract Adoption {
    address[16] public adopters; //address is a datatype; public variable automatically assigns a getter methods
    
    //Adopt a pet
    function adopt(uint petId) public returns(uint){
        require(petId>=0 && petId<=15);
        adopters[petId]=msg.sender;
        return petId;
    }

    //Retrrieving the adopters
    function getAdopters() public view returns (address[16] memory){ //view tells that the function will ont modify the state of contract
        return adopters;
    }



}


