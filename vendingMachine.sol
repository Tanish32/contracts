pragma solidity ^0.5.0;

contract CupcakeVendingMachine {
    uint public stock;
    address payable public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function buyCupcake() public payable {
        require(msg.value == 1 ether, "Price is 1 ETH per cupcake");
        require(stock > 0, "Out of stock");
        stock--;
        owner.transfer(msg.value);
    }
    
    function refillStock(uint _amount) public {
        require(msg.sender == owner, "Only the owner can refill the stock");
        stock += _amount;
    }
}
