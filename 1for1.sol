// reward in ETH.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// import ERC20 functionality
import "./ownable.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
//this is from this guide https://www.quicknode.com/guides/solidity/how-to-create-and-deploy-an-erc-721-nft
contract NFT is NFTokenMetadata, Ownable {
 //set what the ticker wil be
  constructor() {
    nftName = "Synth NFT";
    nftSymbol = "SYN";
  }
    // to is where send to
    // token Id is name
    // what json are you really pointing to 
  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }
 
}