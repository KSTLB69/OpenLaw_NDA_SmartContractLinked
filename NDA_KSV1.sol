    /* Purpose of This Smart contract :
     - Create a new member with its own informations (name + antenna + walletAddress)
     - Only the admin can initiate a new member
     - Get informations from members
     - Anyone can get public informations from members
     - Each members is linked to its own NDA by his personal walletAddress and name 
    */

pragma solidity ^0.6.4;

contract NDA_KS{

  string public message = "This contract is used to anchor some KRYPTOSPHERE®'s members data, linked to their personal NDA created on OpenLaw.io";
    
  struct Person {
      string name;
      string antenna;
      address walletAddress;
    }

  mapping (address => Person) public people;


     function createPerson(string memory name, string memory antenna, address walletAddress) public {
            address creator = 0x866F1571052b617Ce6ac0a29E02F0E9198b5eE58;
            
        Person memory newPerson;
        newPerson.name = name;
        newPerson.antenna = antenna;
        newPerson.walletAddress = walletAddress;

        people[creator] = newPerson;
        
     }
     
     function getPerson() public view returns(string memory name, string memory antenna, address walletAddress){
        address creator = 0x866F1571052b617Ce6ac0a29E02F0E9198b5eE58;
        return (people[creator].name, people[creator].antenna, people[creator].walletAddress);
     }
     
     modifier OnlyNDA_KS {
require ( msg.sender == 0x866F1571052b617Ce6ac0a29E02F0E9198b5eE58 );
_;
}

}
