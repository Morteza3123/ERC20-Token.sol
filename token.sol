// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Token{
    
    uint256 private TotalSupply;
    string private TokenName;
    string private symbol;
    uint256 decimal=10^18;
    address owner;
    
     mapping(address => uint)balances;
    mapping(address => mapping(address=>uint))allowens;
    
    constructor(string memory _name, string memory _symbol){
        TokenName=_name;
        symbol=_symbol;
        
    }
    
   
    
    event approwal(address indexed owner, address indexed spender, uint amount);
    event transferr( address indexed to , uint amount);
    event transferFromm(address indexed from, address indexed to , uint amount);
    
    
    function showbalance()public view returns(uint){
        return(balances[msg.sender]);
    }
    
    function transfer(address _to , uint _amount) public returns(bool success){
        if(balances[msg.sender] <= _amount){
           balances[msg.sender] -= _amount;
           balances[_to] += _amount;
           emit transferr(_to,_amount);
           return true;
        }
    }
    
    function approw(address _spender, uint _amount)public returns(bool){
        allowens[msg.sender][_spender]=_amount;
        emit approwal(msg.sender, _spender, _amount);
        return true;
    }
    function transferFrom(address _from, address _to, uint _amount)public returns(bool success){
        if(balances[_from] <= _amount){
            balances[_from] -= _amount;
            balances[_to] -= _amount;
            emit transferFromm(_from,_to,_amount);
            return true;
            
        }
    }
    
}
