
pragma solidity ^0.4.17

contract Test
{
  uint[] pubic myArray;
  
  function Test() public
  {
      myArray.push(1);
      myArray.push(10);
      myArray.push(30);
      
   }
	 
	function getArrayLength() public view returns(uint)
	{
		return myArray.length;
		
	}
	
	
	 		
   
