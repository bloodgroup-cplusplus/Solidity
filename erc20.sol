 //https://coinsbench.com/erc20-smart-contract-breakdown-9dab65cec671
 // ( refer here for the full article )


 //ERC20 Smart contract breakdown 


 /*500k contracts use the ERC20 standard 
  *In this article we will learn what the ERC20 standard is and we will break down 
  * how uniswap and openzeppelin implement it . 

 /


// Outline of this article . 

/* What is a standard ? 
 * What is the ERC20 Standard?
 * How do Uniswap and OpenZeppelin implement ERC20?
 * Additional functionalty : mint, burn 
 * Additional functionality: mint, burn 
 * Additional functionality : hooks 
 * Additional functionality : allowances 
 * Additional functionality : meta transactions 
 * Fully annotated code 
/

/*What is a standard ?
    An ethereum standard is just a standardized pattern of creating something in ethereum 
    A standard just says what should be done. But it does not specify the details( the how). 
    It's like an  interface in C++ 

    Why do we need standards? Mainly for interoperability. For example, wallets can write 
    one code that will work with all tokens that follow the same ERC20 standard . 

*/

// What is the ERC20 standard ? 
// ERC20 is  a standard used for implementing arbitrary tokens. For example,
// Dogecoin, Shiba Inu, USDC, all use the ERC20 token standard. 

// More formally :ERC20 is a standard for fungible tokens. ( Fungible means 
// all tokens are the same ). NFTs( non-fungible tokens) on the other hand are all unique 

pragma solidity ^0.6.0;

interface ERC20
{
    function name() external pure returns ( string memory);
    // name is the name of the token like "Dogecoin " 
    function symbol () external pure returns ( string memory);
    // symbol is the symbol like DOGE
    function decimals() external pure returns (uint8);
    // decimals is the number of decimal points that the token has. 
    // The default value is 18. Ethereum also uses 18 decimal points(1 Eth = 10**18 wei);
    function totalSupply() external view returns (uint);

    //total supply is the total number of tokens measured in the smallest unit. 
    // for example, if ther were only 5 eth in total for eth token the total supply 
    // should return 5* 10**18

    function balanceOf(address, owner) external view returns (uint);
    // balance of is the balance of the provided address also measured in smallest unit

    function transfer( address to, uint value) external returns (bool);

    // transfer is the function transferring the provided value (again measured in the smallest units)
    // from the sender to the address .

    // in combination , these functions cover the entire behaviour of a token that can be used as 
    // a currency . 
}







    function balanceOf(address owner) external view returns (uint);
    function transfer(address to, uint value) external returns (bool);

}
