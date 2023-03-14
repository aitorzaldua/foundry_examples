// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StakeContract {

    mapping (uint => mapping (address => uint)) s_balances;

    function stake(address token, uint amount) external returns(bool){
        s_balances[msg.sender][token] += amount;
        // @comment - como funciona IERC20 de OZ?
        IERC20(token).transferFrom(msg.sender, address(this), amount);

    }
}