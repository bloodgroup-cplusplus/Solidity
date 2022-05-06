pragma solidity ^0.4.20;

interface ERC20
{
    function name() public view returns (string);
    function symbol() public view returns (string);
    function decimals () public view returns (uint8);

    function totalSupply() public view returns (uint256);
    function balanceOf(address _owner) public view returns (uint256 balance);


    function transfer(address _to, uint256 _value) public returns (bool success);


    function transferFrom (address _from, address _to, uint256 _value) public returns (bool success);


    function approve(address _spender, uint256 _value) public view returns (bool success);


}

