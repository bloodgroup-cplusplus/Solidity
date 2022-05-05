pragma solidity ^0.4.20;

interface ERC721
{
    function name() public view returns (string);
    function symbol () public view returns (string);
    function tokenURI(uint256 _tokenId) public view returns (string);


    function totalSupply() public view returns (uint256);
    function tokenByIndex(uint256 _index) public view returns(uint 256);
    function tokenOfOwnerByIndex(address _owner,uint256 _index) public view returns (uint 256);
    function balanceOf(address _owner) public view returns (uint256);
    function ownerOf(uint256 _tokenId) public view returns (address);
    // name and symbol are NFT descriptors they are "Art Blocks " and "Blocks "
    // token URI = path to token metadata(image url, rarity attributes, etc)
    // total supply - count NFTs tracked by this contract 
    // tokenByIndex - return tokenId of tokenID of token at specified index. 
    // tokenOfOwnerByIndex - enumerate tokens of owner and return tokenId at index
    // balanceOf - number of NFTs owner has 
    // ownerOf - owner of specified token 
    // approve - allow someone else to manage(transfer, sell, etc) one's token. 
    // Used by 3rd parties, like OpenSea, to Manage tokens.
    //transfer from - transfer the token. The caller needs to be a pre-approved address
    // All NFT smart contracts need to implement the ERC-721 standard.
    //This allows third parties like openSea to interact with the NFT 
    //contracts in a standardized way( all contracts will have the same ownerOf function, 

}

