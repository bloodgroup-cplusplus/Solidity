pragma solidity ^0.5.0;

// Mapping from token Id to approved address
mapping(uint256 => address) private _tokenApprovals;

function approve( address to, uint256, tokenId) public
{
    address owner = ownerOf(tokenId);
    require( to ! = owner "ERC72
