pragma solidity 0.5.0;

contract NFTCollection{
	//somewhere here declare an event

	struct ID{
		string name; //not sure if we want names visible on chain
		string eid;
		address walletAddress;
		uint NftNum;   //unique number for each NFT perhaps
	}

	mapping (address => ID) members; //key is a wallet, value is ID
	address[] collectionOwners;

	function createMember(string memory _name, string memory _eid, address _address) public {
		//require statement to ensure there does not already exist an NFT to this person
		
		members[msg.sender] = ID(
			{
				name: _name;
				eid: _eid;
				walletAddress: msg.sender; //not sure
				NftNum = collectionOwners.length;
			}
		);
		collectionOwners.push(msg.sender);
		
		
	} 
}

