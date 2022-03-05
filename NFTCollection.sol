pragma solidity 0.5.0;

import "hardhat/console.sol";

contract NFTCollection{
	//somewhere here declare an event
    event memberCreated(string name, uint256 nftNum);

	struct ID{
		bytes32 name; //not sure if we want names visible on chain
		bytes32 eid;
		address walletAddress;
		uint NftNum;   //unique number for each NFT perhaps
		bool validMember;
	}
    mapping(bytes32 => bool) whitelist;
	mapping (address => ID) members; //key is a wallet, value is ID
	uint256 totalMembers = 0;

    function createWhitelist(string memory _eid) public {

        whitelist[keccak256(abi.encodePacked(_eid))] = true;
    }


	function createMember(string memory _name, string memory _eid, address _address) public {
		require(whitelist[keccak256(abi.encodePacked(_eid))] != false, "EID not in whitelist.");
		
		members[_address] = ID(
			{
				name: keccak256(abi.encodePacked(_name)),
				eid: keccak256(abi.encodePacked(_eid)),
				walletAddress: _address, //not sure
				NftNum: totalMembers,
				validMember: true
			}
		);

        emit memberCreated(_name, totalMembers);
        totalMembers++;
        whitelist[keccak256(abi.encodePacked(_eid))] = false;
	}

	function invalidateMember(address _address, bytes32 _eid) public {
		
		require(members[_address].walletAddress != address(0), "This is not a current member.");
		require(members[_address].eid == _eid, "EID's do not match.");  //hash??
		
		members[_address].validMember = false; 
		
		//maybe an emit here to state something has been invalidated	
	}
	
	function checkMember(string memory _name, string memory _eid) public view returns(string memory){
		require(members[msg.sender].walletAddress !=  address(0), "This is not a current member.");

		require(members[msg.sender].name == keccak256(abi.encodePacked(_name)), "Name does not match.");
		require(members[msg.sender].eid == keccak256(abi.encodePacked(_eid)), "EID does not match.");
		require(members[msg.sender].validMember, "This member is terminated.");
				
		//emit something for frontend
        console.log("yes this is a member");
        return "Member Authenticated";
	}


}
