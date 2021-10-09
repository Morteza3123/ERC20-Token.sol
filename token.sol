// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract Token {
    string public name ;
    string public symbol;
    uint256 public decimal;
    uint256 public totalSupply;
    
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance ;
    
    event Transfer(address indexed from, address indexed to, uint256 _value);
    event Approval(address indexed owner, address indexed spender, uint256 val);
    
    constructor(string memory _name, string memory _symbol, uint _decimals, uint _totalDupply){
        name = _name;
        symbol=_symbol;
        decimal=_decimals;
        totalSupply=_totalDupply;
        balanceOf[msg.sender]=totalSupply;
    }
    
    function transfer(address _to, uint256 _value) external returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        // require( _to != 0 , 'reciever doesent exist' );
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
       emit Transfer(msg.sender, _to, _value);
               return true;
    } 
    
    
    function approve(address _spender, uint256 _value) external returns(bool){
        require(_spender != address(0));
        allowance[msg.sender][_spender] = _value; 
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function TransferFrom(address _from, address _to, uint _value) external returns(bool){
        require(balanceOf[_from] >= _value, "you dont allow to transfer");
        require(allowance[_from][msg.sender] >= _value);
        allowance[_from][msg.sender] -= _value;
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        return true;
    }
    
    
    
    
    
    
    
    
    
    
    
}
