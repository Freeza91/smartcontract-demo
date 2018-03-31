pragma solidity ^0.4.4;

contract ERC20{

  mapping (address => uint256) balances;
  mapping (address => mapping (address => uint256)) allowed;
  uint256 _totalSupply;

  // 全网通知事件
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

  // 获取发行总量
  function totalSupply() constant public returns (uint256 _supply){
    return _totalSupply;
  }

  // 获取某个地址余额
  function balanceOf(address _owner) constant public returns (uint balance){
    return balances[_owner];
  }

  // 从发送者转移Token
  function transfer(address _to, uint256 _value) public returns (bool success){
    require(_value > 0 && balances[msg.sender] >= _value);
    balances[msg.sender] -= _value;
    balances[_to] += _value;

    Transfer(msg.sender, _to, _value);
    return true;
  }

  //从某个地址转移到另一个地址
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
    require(_value > 0 && allowed[_from][msg.sender] >= _value &&
            balances[_from] >= _value);

    balances[_to] += _value;
    balances[_from] -= _value;
    allowed[_from][msg.sender] -= _value;

    Transfer(_from, _to, _value);
    return true;
  }

  //授权某个地址可转移数额
  function approve(address _spender, uint256 _value) public returns (bool success){
    allowed[msg.sender][_spender] = _value;

    Approval(msg.sender, _spender, _value);
    return true;
  }

  //获取可消费数额
  function allowance(address _owner, address _spender) constant public returns (uint256 balance){
    return allowed[_owner][_spender];
  }

}

contract ICOToken is ERC20{

  string public name;
  uint8 public decimals;
  string public symbol;

  function ICOToken(
      string _name,
      uint8 _decimals,
      string _symbol,
      uint256 _initAmount) public {
    _totalSupply = _initAmount;
    name = _name;
    decimals = _decimals;
    symbol = _symbol;
  }

}
