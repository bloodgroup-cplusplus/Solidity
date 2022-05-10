pragma solidity ^0.0.7;


contract tweets
{
    address public owner ;
    // private variable used to increment id of the tweet
    uint256 private counter ;


    // function which runs at start 

    constructor()
    {
        counter = 0;
        owner = msg.sender;
        //msg variable is something we get with the smart contracts
        //anyone interacting with smart contracts can see which wallet is interacting 
    }

    
    struct tweet
    {
        address tweeter;
        uint256 id;
        string tweetTxt;
        string tweetIng;

    }

    // create an event when a new tweet is created on the smart contract 

    event tweetCreated
    {
        address tweeter,
        uint256 id, 
        string tweetTxt,
        string tweetIng,
    }

    // store all of these tweets in some sort of array 

    mapping(uint256 => tweet) Tweets;
    // we provide tweets to store the tweet
    // anytime we create a tweet we store it in tweet mapping 


    // function to add a tweet 
