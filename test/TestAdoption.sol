pragma solidity ^0.5.0;

import "truffle/Assert.sol"; //gives us assertions to use in our tests
import "truffle/DeployedAddresses.sol"; //To deploy a fresh truffle instance and get the address for testing  
import "../contracts/Adoption.sol"; // Contract we want to test

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    //The id of the pet that will be used for testing
    uint expectedPetId=8;


    //The expected owner of adopted pet is this contract
    address expectedAdopter=address(this);


    //Testing the adopt() function
    function testUserCanAdoptPet() public{
        uint returnedId=adoption.adopt(expectedPetId);
        Assert.equal(returnedId, expectedPetId, "Adopton of the expected pet should match what is returned.");

    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);
        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }


    //Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdArray() public {
        //Store adopters in memory rather than  contract's storage
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
}