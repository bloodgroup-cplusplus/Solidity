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
    (
        address tweeter,
        uint256 id, 
        string tweetTxt,
        string tweetIng
    );

    // store all of these tweets in some sort of array 

    mapping(uint256 => tweet) Tweets;
    // we provide tweets to store the tweet
    // anytime we create a tweet we store it in tweet mapping 


    // function to add a tweet 

    function addTweet
    (
        string memory tweetTxt,
        string memory tweetImg
    )

    public payable
    {
        require(msg.value == (1 ether), "Please submit 1 matic");
        tweet storage newTweet = Tweets[counter];
        newTweet.tweetTxt = tweetTxt;
        newTweet.tweetIng = tweetIng;
        newTweet.tweeter = msg.sender;
        newTweet.id = counter;
        emit tweetCreated(
            msg.sender,
            counter,
            tweetTxt,
            tweetImg
        );

        counter++;

        payable(owner).transfer(msg.value);
        // we are requiring the message value of one ether make sure that it is send 
        // to the owner of the smart contract 
        // payable to the owner 
        // transfer the message value 
    }

    // what this function does is that as long as you pass parameter of id 
    // public function that returns string 
    // and these two strings will be tweet image source 
    // adress of log of all the tweets 
    // what the address was who tweeted it 
    // 

    function getTweet(uint256 id) public view returns (string memory, string memory, address)
    {
        require(id < counter, "No such tweet");
        tweet storage t = Tweets[id];
        return (t.tweetTxt, t.tweetImg, t.tweeter);
    }
}




    }
