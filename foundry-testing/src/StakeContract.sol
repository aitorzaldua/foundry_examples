// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error StakeContract_TransferFailed();

contract StakeContract {

    mapping (address => uint256) s_balances;

    function stake(address token, uint amount) external returns(bool){
        s_balances[msg.sender] = s_balances[msg.sender] + amount;
        // @comment - como funciona IERC20 de OZ?
        // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol
        bool success = IERC20(token).transferFrom(msg.sender, address(this), amount);
        if (!success) revert StakeContract_TransferFailed();
        return success;

    }
}