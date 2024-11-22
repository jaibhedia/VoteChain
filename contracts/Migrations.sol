pragma solidity ^0.8.0;

contract Migrations {
    address public owner = msg.sender;
    uint public lastCompletedMigration;

    modifier onlyOwner() {
        require(msg.sender == owner, "Restricted to the contract's owner");
        _;
    }

    function setCompleted(uint completed) external onlyOwner {
        lastCompletedMigration = completed;
    }
}
