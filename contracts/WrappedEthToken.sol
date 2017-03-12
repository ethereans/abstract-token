pragma solidity ^0.4.0;

/**
 * WrappedEthToken is a DelegativeVoteToken
 * 
 * By Ricardo Guilherme Schmidt
 * Released under GPLv3 License
 */

import "./AbstractToken.sol";

contract WrappedEthToken is AbstractToken {
 uint8 constant public base = 18;

 //Minting is by depositing in the contract
 function () 
  payable {
    deposit();
 }

 function deposit() 
  payable {
    mint(msg.sender,msg.value);
 }
 
 function withdraw(uint256 _amount) 
  when_owns (msg.sender, _amount) {
     destroy(msg.sender, _amount);
     if(!msg.sender.send(_amount)) throw;
 }
 
 function withdraw() {
     withdraw(balanceOf(msg.sender));
 }

}