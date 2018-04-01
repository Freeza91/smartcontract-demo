pragma solidity ^0.4.4;

contract ERC20{

  mapping (address => uint256) balances;
  mapping (address => mapping (address => uint256)) allowed;
  uint256 _totalSupply;

  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

  function totalSupply() constant public returns (uint256 _supply){
    return _totalSupply;
  }

  function balanceOf(address _owner) constant public returns (uint balance){
    return balances[_owner];
  }

  function transfer(address _to, uint256 _value) public returns (bool success){
    require(_value > 0 && balances[msg.sender] >= _value);
    balances[msg.sender] -= _value;
    balances[_to] += _value;

    Transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
    require(_value > 0 && allowed[_from][msg.sender] >= _value &&
            balances[_from] >= _value);

    balances[_to] += _value;
    balances[_from] -= _value;
    allowed[_from][msg.sender] -= _value;

    Transfer(_from, _to, _value);
    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool success){
    allowed[msg.sender][_spender] = _value;

    Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) constant public returns (uint256 balance){
    return allowed[_owner][_spender];
  }

}

contract NewICOToken is ERC20{

  string public name;
  uint8 public decimals;
  string public symbol;

  function NewICOToken() public {
    _totalSupply = 1000000000;
    name = "Dragon";
    decimals = 1;
    symbol = "DGN";
    balances[msg.sender] = _totalSupply;
  }

}
