pragma solidity 0.5.0;

contract NFTCollection{
	//somewhere here declare an event

	struct ID{
		string name; //not sure if we want names visible on chain
		string eid;
		address walletAddress;
		uint NftNum;   //unique number for each NFT perhaps
		boolean validMember;
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
				validMember = true;
			}
		);
		collectionOwners.push(msg.sender);
		
		
	}

	function invalidateMember(address _address, string memory _eid) {
		
		require(members[_address] != null, "This is not a current member.");
		require(members[_address].eid == _eid, "EID's do not match.");  //hash??
		
		members[_address].validMember = false; 
		
		//maybe an emit here to state something has been invalidated	
	}
	
	function checkMember(string memory _name,string memory _eid) public view returns(boolean){
		require(members[msg.sender] != null, "This is not a current member.");
		
		require(members[msg.sender].name == _name, "Name does not match.");
		require(rembers[msg.sender].eid == _eid, "EID does not match.");
		require(members[msg.sender].validMember, "This member is terminated.");
				
		//emit something for frontend
		return true;					
	}
}

