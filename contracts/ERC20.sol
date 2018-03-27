pragma solidity ^0.4.4;


contract ERC20 {

  mapping (address => uint256) public balances;
  mapping (address => mapping (address => uint256)) public allowed;

  uint256 public totalSupply = 666666666;
  string public name = 'erc20';
  uint8 public decimals = 18;
  string public symbol = 'erc';

  function ERC20() public {
    balances[msg.sender] = totalSupply;
  }

  function totalSupply() constant returns (uint256){
    return totalSupply;
  }

  function transfer(address _to, uint256 _value) public returns (bool success){
    require(balances[msg.sender] >= _value);

    balances[msg.sender] -= _value;
    balances[_to] += _value;

    // Transfer(msg.sender, _to, _value);

    return true;
  }

  function balanceOf(address _owner) public returns (uint256 balance){
    return balances[_owner];
  }

  function TransferFrom(address _from, address _to, uint256 _value) public returns (bool success){
    uint256 allowance = allowed[_from][msg.sender];
    require(balances[_from] >= _value && allowance >= _value);

    balances[_from] -= _value;
    balances[_to] += _value;

    // Transfer(_from, _to, _value);

    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint256 remaining){
    return allowed[_owner][_spender];
  }

  function approve(address _spender, uint256 _value) public returns (bool success){
    allowed[msg.sender][_spender] = _value;

    // Approval(msg.sender, _spender, _value);

    return true;
  }
}
