// reward in ETH.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// import ERC20 functionality
import "./thignswened/ownable.sol";
import "./ERC-main/ERC721/extensions/ERC721URIStorage.sol";

//this is from this guide https://www.quicknode.com/guides/solidity/how-to-create-and-deploy-an-erc-721-nft
contract niceCoolNFT is ERC721URIStorage,Ownable{
    address myWallet;

    uint CollectionSupply = 8888;
    uint supplyIndex = 0;

    //constructor() public ERC721("nice1for1", "1f1") {myWallet == msg.sender;}
    constructor() ERC721("collectionNFT", "CNFT") {myWallet = msg.sender;}
    // what json are you really pointing to 
    //anyone can run this function

    // the uri function will be determined in js
    function mintNext(string calldata _uri, address _wallet, uint _mintAmount) public{
        //make sure ther is left
        require(supplyIndex < CollectionSupply);
        //minting
        for(uint i;i<_mintAmount;i++){
            super._mint(_wallet, supplyIndex);
            super.monkeNameURISET(supplyIndex, _uri);
        }
        supplyIndex +=1;
    }


    function reveal(string calldata _uri,uint256 _tokenId) external onlyOwner{
        //does one at a time
        super.monkeNameURISET(_tokenId, _uri);
    }
}