pragma solidity ^0.4.25;
import "./ERC20Interface.sol";

// Symbol      : TER
// Name        : Example ICO Fixed Supply Token - Terra (TER)
// Total supply: 1000
// Deployed to : 0xC26684Cd4e334D8435C15C9c16e76A8f1d5035Db
// Source      : (c) BokkyPooBah / Bok Consulting Pty Ltd 2018. The MIT Licence.

// SafeMath library. Prevent uint problems (negative/overflow/underflow)
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}

// Contract function to receive approval and execute function in one call
// Borrowed from MiniMeToken
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}

// Ownership contract
contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }

    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}


contract Terra is ERC20Interface, Owned{
  using SafeMath for uint;

  string public symbol;
  string public name;
  uint8 public decimals;
  uint public _totalSupply;

  mapping(address => uint) balances;
  mapping(address => mapping(address => uint)) allowed;

  constructor() public {
    symbol = "TER";
    name = "Example ICO Fixed Supply Token - Terra (TER)";
    decimals = 18;
    _totalSupply = 1000 * 10**uint(decimals);

  }

  // Total supply
  function totalSupply() public view returns (uint) {
    return _totalSupply.sub(balances[address(0)]);
  }

  // Get the token balance for account `tokenOwner`
  function balanceOf(address tokenOwner) public view returns (uint balance) {
    return balances[tokenOwner];
  }

  // Transfer the balance from token owner's account to `to` account
  // - Owner's account must have sufficient balance to transfer
  // - 0 value transfers are allowed
  function transfer(address to, uint tokens) public returns (bool success) {
    balances[msg.sender] = balances[msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(msg.sender, to, tokens);
    return true;
  }

  // Token owner can approve for `spender` to transferFrom(...) `tokens` from the token owner's account
  function approve(address spender, uint tokens) public returns (bool success) {
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    return true;
  }

  // Transfer `tokens` from the `from` account to the `to` account
  // The calling account must already have sufficient tokens approve for spending from the `from` account and:
  // - From account must have sufficient balance to transfer
  // - Spender must have sufficient allowance to transfer
  // - 0 value transfers are allowed
  function transferFrom(address from, address to, uint tokens) public returns (bool success) {
    balances[from] = balances[from].sub(tokens);
    allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(from, to, tokens);
    return true;
  }

  // Returns the amount of tokens approved by the owner that can be transferred to the spender's account
  function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
    return allowed[tokenOwner][spender];
  }


  // Token owner can approve for `spender` to transferFrom(...) `tokens` from the token owner's account. The `spender` contract function `receiveApproval(...)` is then executed
  function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
    return true;
  }

  // 1 ETH = 2 TER
  function () public payable {
        uint tokens;
        tokens = msg.value * 2;

        // Check if there is any TER token left for exchange -
        // and then substract tokens from totalSupply
        require(_totalSupply >= tokens);
        _totalSupply = _totalSupply.sub(tokens);

        balances[msg.sender] = balances[msg.sender].add(tokens);
        emit Transfer(address(0), msg.sender, tokens);
        owner.transfer(msg.value);
    }


  // Owner can transfer out any accidentally sent ERC20 tokens
  function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
  }
}
