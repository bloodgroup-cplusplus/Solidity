pragma solidity ^0.4.20;

interface ERC721 {

    function name() external view returns (string _name);
    function symbol () external view returns (string _symbol);
    function tokenURI( uint256 _tokenId) external view returns (string);

    function totalSupply() external view returns (uint256);
    function tokenByIndex(uint256 _index) external view returns (uint256);
    function tokenOfOwnerByIndex(address _owner,uint256 _index) external view returns (uint256);

    function balanceOf(address _owner) external view returns (uint256);
    function ownerOf( uint256 _tokenId) external view returns (address);
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable ;

    function transferFrom( address _from, addrress _to, uint256 _tokenId) external payable;

}


