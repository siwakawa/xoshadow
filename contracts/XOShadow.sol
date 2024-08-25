// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Verifier.sol";

contract XOShadow {
    mapping(bytes32 => uint256) private balances;
    mapping(bytes32 => address) private aliasToAddress;
    Verifier private verifier;

    // Events emitted for each relevant operation
    event Deposit(bytes32 indexed aliasHash, uint256 amount);
    event Transfer(bytes32 indexed fromAliasHash, bytes32 indexed toAliasHash, uint256 amount);
    event Withdraw(bytes32 indexed aliasHash, uint256 amount);

    constructor(address _verifierAddress) {
        verifier = Verifier(_verifierAddress);
    }

    // Register a new alias in the contract
    function registerAlias(bytes32 aliasHash, address userAddress) external {
        require(aliasToAddress[aliasHash] == address(0), "Alias already registered");
        aliasToAddress[aliasHash] = userAddress;
    }

    // Deposit funds into an alias
    function deposit(bytes32 aliasHash) external payable {
        require(aliasToAddress[aliasHash] != address(0), "Alias not registered");
        balances[aliasHash] += msg.value;
        emit Deposit(aliasHash, msg.value); // Emit deposit event
    }

    // Transfer funds between aliases using zero-knowledge proofs (zk-SNARKs)
    function transferWithProof(
        bytes32 senderAliasHash,
        bytes32 receiverAliasHash,
        uint256 amount,
        Verifier.Proof memory proof
    ) external {
        require(verifier.verifyProof(proof), "Invalid proof");
        require(balances[senderAliasHash] >= amount, "Insufficient balance");

        balances[senderAliasHash] -= amount;
        balances[receiverAliasHash] += amount;
        emit Transfer(senderAliasHash, receiverAliasHash, amount); // Emit transfer event
    }

    // Withdraw funds from an alias
    function withdraw(bytes32 aliasHash, uint256 amount, address payable to) external {
        require(balances[aliasHash] >= amount, "Insufficient balance");
        balances[aliasHash] -= amount;
        to.transfer(amount);
        emit Withdraw(aliasHash, amount); // Emit withdraw event
    }
}
