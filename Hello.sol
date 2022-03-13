pragma solidity ^0.4.17    
                                                                         
// this specifies the version of solidity                                
                                                                         
contract Inbox                                                           
{                                                                        
    string public message;                                               
    // this defines a new variable called message                        
    // it will be of type string                                         
                                                                         
                                                                         
    function Inbox(string initialMessage) public                         
    {                                                                    
        message = initialMessage                                         
                                                                         
                                                                         
    }                                                                    
                                                                         
    function setMessage(string newMessage) public                        
    {                                                                    
        message = newMessage;                                            
    }                                                                    
                                                                         
    function getMessage() public view returns (string)                   
    {                                                                    
        return message;                                                  
    }                                                                    
                                                                         
}
