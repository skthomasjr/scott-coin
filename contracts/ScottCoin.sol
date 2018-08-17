pragma solidity ^0.4.24;

contract ScottCoin {
  using SafeTokenMath for uint256;

  string public name;
  string public symbol;
  uint8 public decimals;
  uint256 private totalSupply_;

  mapping(address => mapping(address => uint256)) private allowed;

  mapping(address => uint256) private balances;

  constructor () public {
    name = 'Scott Coin';
    symbol = 'SKT';
    decimals = 18;
    uint256 max = 2 ** 256 - 1;
    balances[msg.sender] = max;
    totalSupply_ = max;
    emit Transfer(msg.sender, msg.sender, max);
  }

  function () public {
    revert();
  }

  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }

  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_value <= balances[msg.sender]);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender].subtract(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    require(_to != address(0));

    balances[_from] = balances[_from].subtract(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].subtract(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }

  event Transfer(address indexed from, address indexed to, uint256 value);

  event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeTokenMath {
  function add(uint256 _a, uint256 _b) internal pure returns (uint256) {
    uint256 c = _a + _b;
    require(c >= _a);
    return c;
  }

  function subtract(uint256 _a, uint256 _b) internal pure returns (uint256) {
    require(_b <= _a);
    uint256 c = _a - _b;
    return c;
  }
}
