// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract CounterContract {
    address owner;

    struct Counter{
        uint number;
        string description;
    }

    Counter counter;

    constructor(uint _number, string memory _description) {
        counter = Counter(_number, _description);
    }

    modifier onlyOwner(){
        require(owner == msg.sender);
        _;
    }

    function increment()external onlyOwner {
        counter.number += 1;
    }
    
    function decrement()external onlyOwner {
        counter.number -= 1;
    }

    function current()external view returns(uint) {
        return counter.number;
    }

    function viewDescription() external view returns(string memory){
        return counter.description;
    }
}