// reward in ETH.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// import ERC20 functionality
import "./thignswened/ownable.sol";
import "./ERC-main/ERC721/extensions/ERC721URIStorage.sol";

//this is from this guide https://www.quicknode.com/guides/solidity/how-to-create-and-deploy-an-erc-721-nft
contract niceCoolNFT is ERC721URIStorage,Ownable{
    address myWallet;

    //constructor() public ERC721("nice1for1", "1f1") {myWallet == msg.sender;}
    constructor() ERC721("nice1for1", "1f1") {myWallet = msg.sender;}
    // what json are you really pointing to 
    //anyone can run this function
    function mint(uint256 _tokenId, string calldata _uri, address _wallet) public{
        super._mint(_wallet, _tokenId);
        super.monkeNameURISET(_tokenId, _uri);
    }

    //example of this
    //the folder in ipfs look at https://ipfs.io/ipfs/QmT87XRj2ZuDDahr85mMyFz8HjkoEFmEBLU1ysdL7p4Hjd
    //only owner makes it where only the owner can run this function
    function mintExample(uint256 _tokenId) external onlyOwner {
        super._mint(myWallet, _tokenId);
        super.monkeNameURISET(_tokenId, "https://ipfs.io/ipfs/QmaTtst1XeB97HkjSTdD3HJGAwosJbXoFWeczRBTELZrCQ?filename=example.json");
    }

    function reveal(string calldata _uri,uint256 _tokenId) external onlyOwner{
        super.monkeNameURISET(_tokenId, _uri);
    }
}