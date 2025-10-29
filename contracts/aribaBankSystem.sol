
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title aribaBank - A tiny on-chain transparent "bank" for learning
/// @author Ariba
/// @notice This contract is for educational/demo use. It is NOT production-ready.
/// @dev Uses a simple reentrancy guard and stores user balances on-chain.
contract aribaBank {
    // --- State ---
    address public owner;
    mapping(address => uint256) private balances;
    bool private locked; // simple nonReentrant guard

    // --- Events ---
    event Deposited(address indexed account, uint256 amount);
    event Withdrawn(address indexed account, uint256 amount);
    event Transferred(address indexed from, address indexed to, uint256 amount);
    event EmergencyWithdrawal(address indexed by, uint256 amount);

    // --- Modifiers ---
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier nonReentrant() {
        require(!locked, "Reentrant call");
        locked = true;
        _;
        locked = false;
    }

    /// @notice Set deployer as owner
    constructor() {
        owner = msg.sender;
        locked = false;
    }

    // --- Core functions ---

    /// @notice Deposit ETH into your account
    /// @dev payable so users can send Ether
    function deposit() external payable {
        require(msg.value > 0, "Must send ETH");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    /// @notice Withdraw up to your balance
    /// @param amount The amount in wei to withdraw
    function withdraw(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount > 0");
        uint256 bal = balances[msg.sender];
        require(bal >= amount, "Insufficient balance");

        // --- Checks-Effects-Interactions ---
        balances[msg.sender] = bal - amount;

        // Interaction last
        (bool ok, ) = payable(msg.sender).call{value: amount}("");
        require(ok, "Transfer failed");

        emit Withdrawn(msg.sender, amount);
    }

    /// @notice Transfer funds to another user inside the bank (internal ledger)
    /// @param to Recipient address
    /// @param amount Amount in wei to transfer
    function transferTo(address to, uint256 amount) external {
        require(to != address(0), "Invalid recipient");
        require(amount > 0, "Amount > 0");
        uint256 bal = balances[msg.sender];
        require(bal >= amount, "Insufficient balance");

        balances[msg.sender] = bal - amount;
        balances[to] += amount;

        emit Transferred(msg.sender, to, amount);
    }

    // --- Viewers ---

    /// @notice Get your current balance in the bank
    function myBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    /// @notice Get balance of any address (transparent)
    /// @param who The address to query
    function balanceOf(address who) external view returns (uint256) {
        return balances[who];
    }

    /// @notice The total ETH held by the contract (should equal sum of balances)
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // --- Owner / Emergency actions ---

    /// @notice Emergency withdraw of the entire contract (owner only).
    /// @dev Use only for demos; in real systems this would be dangerous.
    function emergencyWithdraw() external onlyOwner nonReentrant {
        uint256 amount = address(this).balance;
        require(amount > 0, "Nothing to withdraw");
        // Reset internal balances to zero for transparency (optional)
        // NOTE: iterating over all accounts isn't feasible on-chain; omitted.
        (bool ok, ) = payable(owner).call{value: amount}("");
        require(ok, "Withdraw failed");
        emit EmergencyWithdrawal(owner, amount);
    }

    // --- Fallbacks ---
    receive() external payable {
        // Allow direct sends to be considered deposits for convenience
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    fallback() external payable {
        // Accept plain calls with data as deposits too
        if (msg.value > 0) {
            balances[msg.sender] += msg.value;
            emit Deposited(msg.sender, msg.value);
        }
    }
}
