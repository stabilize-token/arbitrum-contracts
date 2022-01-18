// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);
    
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.6.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.6.0;

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity ^0.6.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol

pragma solidity ^0.6.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _governance;

    event GovernanceTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _governance = msgSender;
        emit GovernanceTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function governance() public view returns (address) {
        return _governance;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyGovernance() {
        require(_governance == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferGovernance(address newOwner) internal virtual onlyGovernance {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit GovernanceTransferred(_governance, newOwner);
        _governance = newOwner;
    }
}

contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor () internal {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

// File: contracts/strategies/StabilizeStrategyFlashImpermaxWETHV1.sol

pragma solidity =0.6.6;

// This is a strategy that deposits into multiple Impermax vaults that earn single asset interest
// The contract redistributes the single asset depending on the rate change since the last rebalance call.
// It will attempt to put all the asset into the highest earning vault

interface StabilizeBank{
    function depositSTBZ(address _credit, uint256 amount) external;
}

interface SushiLikeRouter {
    function swapExactETHForTokens(uint, address[] calldata, address, uint) external payable returns (uint[] memory);
    function swapExactTokensForTokens(uint, uint, address[] calldata, address, uint) external returns (uint[] memory);
    function getAmountsOut(uint, address[] calldata) external view returns (uint[] memory); // For a value in, it calculates value out
}

interface WETH {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
}

interface ImpermaxToken{
    function exchangeRate() external returns (uint); // Updates the exchange
    function exchangeRateLast() external view returns (uint256);
    function totalBalance() external view returns (uint256); // Liquidity inside the pool
    function redeem(address redeemer) external returns (uint256 redeemAmount);
}

interface ImpermaxRouter{
    function mint(address poolToken, uint amount, address to, uint deadline) external returns (uint tokens);
}

interface FlashLoanReceiver {
    /**
     * @dev Receive a flash loan.
     * @param initiator The initiator of the loan.
     * @param token The loan currency.
     * @param amount The amount of tokens lent.
     * @param fee The additional amount of tokens to repay.
     * @param data Arbitrary data structure, intended to contain user-defined parameters.
     * @return The bool of true
     */
    function onFlashLoan(
        address initiator,
        address token,
        uint256 amount,
        uint256 fee,
        bytes calldata data
    ) external returns (bool);
}

contract StabilizeStrategyFlashImpermaxWETHV1 is Ownable, ReentrancyGuard {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address;
    
    address public bankAddress; // Address to the STBZ buyback bank
    address public zsTokenAddress; // The address of the controlling zs-Token
    
    uint256 constant public DIVISION_FACTOR = 100000;
    uint256 public lastRebalanceTime = 0;
    uint256 public lastTokenBalance = 0; // Balance before last deposit or withdraw
    uint256 public lastBestVaultIndex = 0; // Vault that currently has most of the strategy liquidity / highest apr
    bool private _flashActive = false;
    uint256 private _flashFee = 29; // Flash loan fee is 0.029%
    
    // Depositor info
    uint256 public percentDepositor = 90000; // 1000 = 1%, depositors earn 90% of all interest earned
    uint256 public percentFlashDepositor = 50000; // 1000 = 1%, depositors earn 50% of all flash loan profit earned
    // Anything left over goes towards buyback bank and executor

    // Executor info
    uint256 public maxPercentStipend = 30000; // The maximum amount of WETH profit that can be allocated to the executor for gas in percent
    uint256 public gasPrice = 2000000000; // 2 Gwei, governance can change
    uint256 public gasStipend = 1500000; // This is the gas units that are covered by executing a trade taken from the WETH profit
    uint256 public percentExecutor = 20000; // 20000 = 20% of WETH goes to executor

    bool public emergencyWithdrawMode = false; // Activated in case tokens get stuck in strategy after 24 hour timelock
    
    // Token information
    // This strategy accepts WETH
    struct TokenInfo {
        IERC20 token; // Reference of token
        uint256 decimals; // Decimals of token
    }
    
    TokenInfo[] private tokenList; // An array of tokens accepted as deposits
    mapping(address => bool) public blockedBorrowers;
    
    event Flashloan(address _receiver, uint256 amount, uint256 totalFee);

    struct VaultInfo {
        address vaultID; // Impermax ID for vault
        address mintableToken; // Token that we are minting from the vault
        uint256 lastExchangeRate; // Exchange rate at the last rebalance call
    }

    VaultInfo[] private VaultList;

    // Strategy specific variables
    address constant SUSHI_ROUTER = address(0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506);
    address constant WETH_ADDRESS = address(0x82aF49447D8a07e3bd95BD0d56f35241523fBab1);
    address constant STBZ_ADDRESS = address(0x2C110867CA90e43D372C1C2E92990B00EA32818b);
    address constant IMPERMAX_ROUTER = address(0x5475aEd9d11BeaA822e122C36ACDfa0dA2eb086f);
    
    constructor(
        address _bank,
        address _zsToken
    ) public {
        bankAddress = _bank;
        zsTokenAddress = _zsToken;
        setupWithdrawTokens();
        setupImpermaxVaults();
    }

    receive() external payable {
        
    }

    // Initialization functions
    
    function setupWithdrawTokens() internal {
        // Start with WETH
        IERC20 _token = IERC20(address(0x82aF49447D8a07e3bd95BD0d56f35241523fBab1));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals()
            })
        );
    }

    function setupImpermaxVaults() internal {
        // Vault 1
        address _mintable = address(0x4E7c57461a23a973C5487F0658C660aa52Dd196D);
        VaultList.push(
            VaultInfo({
                vaultID: address(0xB0e7Ad5053414fDe098122B61fd34D816fd6D93f),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 2
        _mintable = address(0x608B8DA26CF1DD94aE62bfe3798f808d65a51600);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x88a0B00BBE918eE00e3482F71962070Dc052984b),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 3
        _mintable = address(0x85726E58dDfF14b5bC7CFee7BF7EFd2B39CD31a2);
        VaultList.push(
            VaultInfo({
                vaultID: address(0xb8942A1c1bBb90272190269D42C2F1Dff2Fde3A4),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 4
        _mintable = address(0x0Cf0eC28869367A4fe6B24A487991FaFF9788BF1);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x35b44b303EaCB71114AA62fE8dAe6f9c5DE0F680),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 5
        _mintable = address(0xB81af0eE6959d437E3A29A94C89ecD04fE76171A);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x7532A8d8a12BDd871796a07aC90E510b1CC8f694),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 6
        _mintable = address(0xCd43695E650D8f56405fE262190483BCe774A8DE);
        VaultList.push(
            VaultInfo({
                vaultID: address(0xa6E69dD0C36F3b59539e2c7aFD274eF91b5c70F9),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 7
        _mintable = address(0x52778dc7916c4810E9a2682E7d1fe674b1Fd65ac);
        VaultList.push(
            VaultInfo({
                vaultID: address(0xB7E5e74B52b9aDa1042594Cfd8AbbdeE506cc6C5),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 8
        _mintable = address(0x8CBe3495CF37ad65F5F1c63ED8713613d8E537bC);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x6D94F7e67C6ae0B0257C35754e059FDfB249d998),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 9
        _mintable = address(0x0907064c89B4a717AC33caD36318Ae0161E58E9e);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x95c9bF3f60Cbc2BE8e148FAe82f26930bFcD1839),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 10
        _mintable = address(0x908221669C081a79b13F656f0F814C2c419167f9);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x092162807896509aFe042b7f839Ab30e1cA11670),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 11
        _mintable = address(0x638F8E35F97F30eCe93D4ceB0eCe4Ed00bF0F7F1);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x82cDE182702841DaB46916738207123FE535909F),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 12
        _mintable = address(0x0306a59E747692eA1F716172d4f7e0C9D31e3BB7);
        VaultList.push(
            VaultInfo({
                vaultID: address(0xC48a16493B97BF90545793cF89884eDe71AaC39a),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 13
        _mintable = address(0xafcF39Df4c47F1DCcedF26B9c75Da6EBcfCe8840);
        VaultList.push(
            VaultInfo({
                vaultID: address(0xCC5c1540683AFF992201d8922DF44898E1Cc9806),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 14
        _mintable = address(0xA290dd13CcaA4Eb195decCcF83EbC211cCF06f61);
        VaultList.push(
            VaultInfo({
                vaultID: address(0xe965129938867a125F91a67E1b6D34d022bDA569),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 15
        _mintable = address(0xf2982b6A5Fd1D31493cEB4ba81cf393EEf015dAD);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x4fefA59353636C64c5950Fd23c969CBaaB5E7BBa),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Vault 16
        _mintable = address(0xBDEB3A7CCf96096aEA9CBf4f1A55D30cc1627540);
        VaultList.push(
            VaultInfo({
                vaultID: address(0x4062f4775BC001595838FBaAE38908b250Ee07cf),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );

        // Governance can add more vaults if needed
    }
    
    // Modifier
    modifier onlyZSToken() {
        require(zsTokenAddress == _msgSender(), "Call not sent from the zs-Token");
        _;
    }

    modifier outsideFlashLoan() {
        require(_flashActive == false, "Call sent from inside flash loan");
        _;
    }
    
    // Read functions
    
    function rewardTokensCount() external view returns (uint256) {
        return tokenList.length;
    }
    
    function rewardTokenAddress(uint256 _pos) external view returns (address) {
        require(_pos < tokenList.length,"No token at that position");
        return address(tokenList[_pos].token);
    }
    
    function balance() public view returns (uint256) {
        return getNormalizedTotalBalance(address(this));
    }

    function totalTokenInVault(address mintableToken) internal view returns (uint256) {
        ImpermaxToken mintToken = ImpermaxToken(mintableToken);
        uint256 rate = mintToken.exchangeRateLast();
        uint256 _equivalent = IERC20(mintableToken).balanceOf(address(this)).mul(rate).div(1e18);
        return _equivalent; // No decimal conversion needed as Impermax doesn't do it       
    }

    function totalLockedValue() public view returns (uint256) {
        uint256 _length = VaultList.length;
        uint256 tokenEquivalent = 0;
        for(uint256 i = 0; i < _length; i++){
            tokenEquivalent = tokenEquivalent.add(totalTokenInVault(VaultList[i].mintableToken));
        }
        return tokenEquivalent;
    }

    function totalStrategyLiquidity() public view returns (uint256) {
        uint256 _length = VaultList.length;
        uint256 liquid = 0;
        for(uint256 i = 0; i < _length; i++){
            ImpermaxToken mintToken = ImpermaxToken(VaultList[i].mintableToken);
            uint256 liq = mintToken.totalBalance();
            uint256 stratToken = totalTokenInVault(VaultList[i].mintableToken);
            if(stratToken < liq){
                liq = stratToken;
            }
            liquid = liquid.add(liq);
        }
        return liquid;       
    }

    function totalStrategyLiquidityCurrent() public returns (uint256) {
        updateExchangeRates();
        return totalStrategyLiquidity();
    }
    
    function getNormalizedTotalBalance(address _address) public view returns (uint256) {
        // Get the balance of the tokens at this address
        uint256 _balance = 0;
        uint256 _length = tokenList.length;
        for(uint256 i = 0; i < _length; i++){
            uint256 _bal = tokenList[i].token.balanceOf(_address);
            _bal = _bal.mul(1e18).div(10**tokenList[i].decimals);
            _balance = _balance.add(_bal); // This has been normalized to 1e18 decimals
        }

        // Now get the total token balance of the tokens in the Impermax vaults
        uint256 tokenEquivalent = totalLockedValue();
        
        if(lastTokenBalance > 0 && tokenEquivalent > lastTokenBalance){
            // We will subtract the last balance so that we can exclude pending interest payout
            uint256 interest = tokenEquivalent.sub(lastTokenBalance);
            tokenEquivalent = interest.mul(percentDepositor).div(DIVISION_FACTOR).add(lastTokenBalance);
        }

        // Convert token equivalent to normalized
        _balance = tokenEquivalent.mul(1e18).div(10**tokenList[0].decimals).add(_balance);

        return _balance;
    }
    
    function withdrawTokenReserves() public view returns (address, uint256) {
        (uint256 targetID, uint256 _bal) = withdrawTokenReservesID();
        if(_bal == 0){
            return (address(0), _bal);
        }else{
            return (address(tokenList[targetID].token), _bal);
        }
    }
    
    function withdrawTokenReservesID() internal view returns (uint256, uint256) {
        return (0, lastTokenBalance);
    }
    
    // Write functions
    
    function enter() external onlyZSToken outsideFlashLoan {
        deposit(false);
    }
    
    function exit() external onlyZSToken outsideFlashLoan {
        // The ZS token vault is removing all tokens from this strategy
        withdraw(_msgSender(),1,1, false);
    }
    
    // Only the ZS token can call the function
    function deposit(bool nonContract) public onlyZSToken outsideFlashLoan {
        require(emergencyWithdrawMode == false, "Cannot deposit in emergency mode");
        rebalance(address(0));
        
        // No trading is performed on deposit
        if(nonContract == true){ }
        depositIntoVaults(); // Needed in case multiple deposits in same block
    }
    
    // Test function
    /*
    function testDeposit() external payable {
        WETH(address(tokenList[0].token)).deposit{value: msg.value}();
    }
    */

    function updateExchangeRates() public {
        // This will update the exchange rates for all the vaults
        uint256 _length = VaultList.length;
        for(uint256 i = 0; i < _length; i++){
            ImpermaxToken(VaultList[i].mintableToken).exchangeRate(); // Force update the exchange rates in the protocol
        }
    }

    function pullBalance(uint256 _amount, bool pullAll) internal {
        // This will pull the specified amount of funds from the contract
        if(pullAll == true){
            require(totalLockedValue() <= totalStrategyLiquidity(), "Not enough liquidity to pull all funds");
            // Pull from all the vaults
            uint256 _length = VaultList.length;
            for(uint256 i = 0; i < _length; i++){
                IERC20 mintToken = IERC20(VaultList[i].mintableToken);
                uint256 _bal = mintToken.balanceOf(address(this));
                if(_bal > 0){
                    mintToken.safeTransfer(VaultList[i].mintableToken, _bal);
                    ImpermaxToken(VaultList[i].mintableToken).redeem(address(this)); // This will redeem token to the contract
                }
            }
        }else{
            require(_amount <= totalStrategyLiquidity(), "Not enough liquidity to pull");
            // Now pull all the available liquidity from the pools
            pullAvailableLiquidity();
        }
    }

    function pullAvailableLiquidity() internal {
        // This will pull the available liquidity for the strategy to use in other pools
        uint256 _length = VaultList.length;
        for(uint256 i = 0; i < _length; i++){
            IERC20 mintToken = IERC20(VaultList[i].mintableToken);
            uint256 _bal = mintToken.balanceOf(address(this));
            if(_bal > 0){
                // Convert to Impermax tokens
                ImpermaxToken tok = ImpermaxToken(VaultList[i].mintableToken);
                uint256 availToken = tok.totalBalance();
                uint256 tokensAvailable = availToken.mul(1e18).div(tok.exchangeRateLast());
                if(tokensAvailable < _bal){
                    _bal = tokensAvailable; // We cannot take out more than this amount due to liquidity issues
                }
                if(_bal > 0){
                    mintToken.safeTransfer(VaultList[i].mintableToken, _bal);
                    ImpermaxToken(VaultList[i].mintableToken).redeem(address(this)); // This will redeem token to the contract
                }
            }
        }
    }

    function payInterest(uint256 interestOwed, address _executor) internal {
        require(interestOwed <= tokenList[0].token.balanceOf(address(this)), "Not enough available to pay out interest");

        if(interestOwed > 0){
            // Split the rest between the executor and buyback
            // This is pure profit, figure out allocation
            if(_executor != address(0)){
                // Executors will get a gas reimbursement in WETH and a percent of the remaining
                uint256 maxGasFee = gasPrice.mul(gasStipend); // This is gas stipend in wei
                uint256 gasFee = tx.gasprice.mul(gasStipend); // This is gas fee requested
                if(gasFee > maxGasFee){
                    gasFee = maxGasFee; // Gas fee cannot be greater than the maximum
                }
                uint256 executorAmount = gasFee;
                if(gasFee >= interestOwed.mul(maxPercentStipend).div(DIVISION_FACTOR)){
                    executorAmount = interestOwed.mul(maxPercentStipend).div(DIVISION_FACTOR); // The executor will get the entire amount up to point
                }else{
                    // Add the executor percent on top of gas fee
                    executorAmount = interestOwed.sub(gasFee).mul(percentExecutor).div(DIVISION_FACTOR).add(gasFee);
                }
                if(executorAmount > 0){
                    // Convert to ETH
                    WETH(WETH_ADDRESS).withdraw(executorAmount); // Convert some WETH into 
                    payable(_executor).transfer(executorAmount); // Transfer to executor
                    if(executorAmount < interestOwed){
                        interestOwed = interestOwed.sub(executorAmount);
                    }else{
                        interestOwed = 0;
                    }
                }
            }
            if(interestOwed > 0){
                doSTBZBuyback(WETH_ADDRESS, interestOwed); // Buy STBZ with the WETH
            }                
        }
    }

    function rebalance(address _executor) internal {
        // Get the amount of interest owed to caller of this function and for buybacks
        updateExchangeRates();
        uint256 interestOwed = 0;
        lastRebalanceTime = now;
        uint256 totalVaultTokens = totalLockedValue();
        if(lastTokenBalance > 0 && totalVaultTokens > lastTokenBalance){
            interestOwed = totalVaultTokens.sub(lastTokenBalance).mul(DIVISION_FACTOR.sub(percentDepositor)).div(DIVISION_FACTOR);
        }

        // This function will determine the highest earning pool and move available liquidity into that pool
        uint256 _length = VaultList.length;
        uint256 _bestReturn = 0;
        uint256 _bestReturnIndex = 0;
        for(uint256 i = 0; i < _length; i++){
            ImpermaxToken mintToken = ImpermaxToken(VaultList[i].mintableToken);
            uint256 rate = mintToken.exchangeRateLast();
            uint256 change = 0;
            if(rate > VaultList[i].lastExchangeRate && VaultList[i].lastExchangeRate > 0){
                change = rate.sub(VaultList[i].lastExchangeRate).mul(1e18).div(VaultList[i].lastExchangeRate);
            }
            if(change > _bestReturn){
                _bestReturn = change;
                _bestReturnIndex = i;
            }
            VaultList[i].lastExchangeRate = rate;
        }

        if(_bestReturn == 0){
            // There was no change
            return;
        }

        // Pull all available liquidity
        pullAvailableLiquidity();

        // Swap some WETH for STBZ
        if(interestOwed > 0){
            payInterest(interestOwed, _executor);
        }

        lastBestVaultIndex = _bestReturnIndex;

        depositIntoVaults(); // This will auto deposit token into the highest returning vault
    }

    function depositIntoVaults() internal {
        // Now redeposit the tokens into the highest earning strategy
        ImpermaxRouter router = ImpermaxRouter(IMPERMAX_ROUTER); 
        uint256 _bal = tokenList[0].token.balanceOf(address(this));
        if(_bal > 0){
            tokenList[0].token.safeApprove(IMPERMAX_ROUTER, 0);
            tokenList[0].token.safeApprove(IMPERMAX_ROUTER, _bal);
            router.mint(VaultList[lastBestVaultIndex].mintableToken, _bal, address(this), now.add(60));
        }

        lastTokenBalance = totalLockedValue();
    }

    function expectedProfit() external returns (
        uint256 // Profit amount for executor in ETH
        ) {
        updateExchangeRates();
        return expectedProfitLast();
    }

    function expectedProfitLast() public view returns (
        uint256 // Profit amount for executor in ETH
        ) {
        uint256 interestOwed = 0;
        uint256 totalVaultTokens = totalLockedValue();
        if(lastTokenBalance > 0 && totalVaultTokens > lastTokenBalance){
            interestOwed = totalVaultTokens.sub(lastTokenBalance).mul(DIVISION_FACTOR.sub(percentDepositor)).div(DIVISION_FACTOR);
        }
        if(interestOwed == 0) { return 0; }
        uint256 estimate = interestOwed;

        // Now calculate the amount going to the executor
        uint256 gasFee = gasPrice.mul(gasStipend); // This is gas stipend in wei
        if(gasFee >= estimate.mul(maxPercentStipend).div(DIVISION_FACTOR)){ // Max percent of total
            return (estimate.mul(maxPercentStipend).div(DIVISION_FACTOR)); // The executor will get max percent of total
        }else{
            estimate = estimate.sub(gasFee); // Subtract fee from remaining balance
            return (estimate.mul(percentExecutor).div(DIVISION_FACTOR).add(gasFee)); // Executor amount with fee added
        }
    }

    function doSTBZBuyback(address originToken, uint256 _amount) internal {
        SushiLikeRouter router = SushiLikeRouter(SUSHI_ROUTER);
        address[] memory path = new address[](2);
        path[0] = originToken;
        path[1] = STBZ_ADDRESS;
        IERC20(path[0]).safeApprove(address(router), 0);
        IERC20(path[0]).safeApprove(address(router), _amount);
        router.swapExactTokensForTokens(_amount, 1, path, address(this), now.add(60)); // Get STBZ
        uint256 _bal = IERC20(STBZ_ADDRESS).balanceOf(address(this));
        if(_bal > 0){
            IERC20(STBZ_ADDRESS).safeApprove(bankAddress, 0);
            IERC20(STBZ_ADDRESS).safeApprove(bankAddress, _bal);  
            StabilizeBank(bankAddress).depositSTBZ(zsTokenAddress, _bal); // This will pull the balance
        }
        return;
    }

    // Flash functionality
    // Borrowers can borrow the entire stack without collateral but must pay it back before transaction end, otherwise revert
    function maxFlashLoan() public view returns (uint256) {
        uint256 _bal = tokenList[0].token.balanceOf(address(this));
        return totalStrategyLiquidity().add(_bal);
    }
    
    // Returns the fee amount for a specific amount borrowed
    function flashFee(uint256 _forAmount) public view returns (uint256) {
        return _forAmount.mul(_flashFee).div(DIVISION_FACTOR);
    }
    
    // Returns the fee percent to be used along with DIVISION_FACTOR
    function flashFeePercent() external view returns (uint256) {
        return _flashFee;
    }
    
    // User calls the flash loan on the vault
    function flashLoan(
        FlashLoanReceiver receiver,
        uint256 amount,
        bytes calldata data
    ) external outsideFlashLoan nonReentrant returns (bool) {
        address initiator = _msgSender();
        _flashActive = true; // Prevent re-entry anywhere in the contract
        require(amount > 0, "flashLoan amount should be greater than zero");
        require(address(receiver).isContract() == true, "Can't send to a JIT contract");
        require(blockedBorrowers[address(receiver)] == false && blockedBorrowers[initiator] == false, "User is blocked from borrowing");
        require(amount <= maxFlashLoan(), "Not enough funds to lend");
        
        // 1. calculate fee, 1 = 1/100000
        uint256 totalFee = flashFee(amount);

        // 2. pull liquidity from strategy
        pullAvailableLiquidity();
        
        // 3. transfer fund to receiver
        tokenList[0].token.safeTransfer(address(uint160(address(receiver))),amount);
        
        // 4. execute receiver's callback function
        require(
            receiver.onFlashLoan(initiator, address(tokenList[0].token), amount, totalFee, data) == true,
            "Flash loan callback failed"
        );
        
        // 5. take amount + fee from receiver, then check balance
        uint256 repaymentAmount = amount.add(totalFee);
        uint256 _gain = tokenList[0].token.balanceOf(address(this));
        tokenList[0].token.safeTransferFrom(address(receiver), address(this), repaymentAmount);
         _gain = tokenList[0].token.balanceOf(address(this)).sub(_gain);
        require(_gain == repaymentAmount, "Unexpected balance gain");
        
        // Do the buyback with some of the WETH fee
        uint256 buyAmount = totalFee.mul(DIVISION_FACTOR.sub(percentFlashDepositor)).div(DIVISION_FACTOR);
        doSTBZBuyback(WETH_ADDRESS, buyAmount); // Buy STBZ with the WETH

        // 6. redeposit into the strategy
        depositIntoVaults();
        
        emit Flashloan(address(receiver), amount, totalFee);
        _flashActive = false;
        return true;
    }
    
    function withdraw(address _depositor, uint256 _share, uint256 _total, bool nonContract) public onlyZSToken outsideFlashLoan returns (uint256) {
        require(balance() > 0, "There are no tokens in this strategy");
        rebalance(address(0));
        if(nonContract){}
        
        uint256 withdrawAmount = 0;
        uint256 _balance = balance();
        if(_share < _total){
            uint256 _myBalance = _balance.mul(_share).div(_total);
            withdrawOne(_depositor, _myBalance, false); // This will withdraw based on token balance
            withdrawAmount = _myBalance;
        }else{
            // We are all shares, transfer all
            withdrawOne(_depositor, _balance, true);
            withdrawAmount = _balance;
        }

        depositIntoVaults();
        
        return withdrawAmount;
    }
    
    // This will withdraw the token from the contract
    function withdrawOne(address _receiver, uint256 _withdrawAmount, bool _takeAll) internal {
        if(_takeAll == true){
            pullBalance(0, true);
            // Send the entire balance
            uint256 _bal = tokenList[0].token.balanceOf(address(this));
            if(_bal > 0){
                tokenList[0].token.safeTransfer(_receiver, _bal);
            }
            return;
        }

        // Pull the available liquidity from the pools
        uint256 tokenAmount = _withdrawAmount.mul(10**tokenList[0].decimals).div(1e18);
        pullBalance(tokenAmount, false);

        // Determine the balance left
        uint256 _normalizedBalance = tokenList[0].token.balanceOf(address(this)).mul(1e18).div(10**tokenList[0].decimals);
        if(_normalizedBalance <= _withdrawAmount){
            // Withdraw the entire balance of this token
            if(_normalizedBalance > 0){
                _withdrawAmount = _withdrawAmount.sub(_normalizedBalance);
                tokenList[0].token.safeTransfer(_receiver, tokenList[0].token.balanceOf(address(this)));                    
            }
        }else{
            // Withdraw a partial amount of this token
            if(_withdrawAmount > 0){
                // Convert the withdraw amount to the token's decimal amount
                uint256 _balance = _withdrawAmount.mul(10**tokenList[0].decimals).div(1e18);
                _withdrawAmount = 0;
                tokenList[0].token.safeTransfer(_receiver, _balance);
            }
        }
    }

    function executorSwapTokens(address _executor, uint256 _minSecSinceLastTrade, uint256 _deadlineTime) external outsideFlashLoan {
        // Function designed to promote trading with incentive
        require(now <= _deadlineTime, "Deadline has expired, aborting trade");
        require(now.sub(lastRebalanceTime) >= _minSecSinceLastTrade, "The last trade was too recent");
        require(_msgSender() == tx.origin, "Contracts cannot interact with this function");
        rebalance(_executor);
    }
    
    // Governance functions
    function governanceSwapTokens() external onlyGovernance {
        // This is function that force trade tokens at anytime. It can only be called by governance
        rebalance(governance());
    }

    // Change the executor conditions used by the strategy without timelock
    // --------------------
    function changeExecutorConditions(
                                    uint256 _pExecutor,
                                    uint256 _pStipend,
                                    uint256 _maxStipend,
                                    uint256 _gasPrice) external onlyGovernance {
        // Changes a lot of trading parameters in one call
        require(_pStipend <= 100000 && _pExecutor <= 100000,"Percent cannot be greater than 100%");
        percentExecutor = _pExecutor;
        maxPercentStipend = _pStipend;
        gasStipend = _maxStipend;
        gasPrice = _gasPrice;
    }
    //

    function governanceToggleBlockBorrower(address _borrower, bool _blocked) external onlyGovernance {
        blockedBorrowers[_borrower] = _blocked;
    }
    
    function governanceChangeFlashFee(uint256 _fee) external onlyGovernance {
        require(_fee < DIVISION_FACTOR, "Fee is too high");
        _flashFee = _fee;
    }

    // This function is used in case tokens get stuck in strategy, it is used for experimental strategies to prevent any-cause loss of funds (after 24 hour timelock)
    function governanceEmergencyWithdrawToken(address _token, uint256 _amount) external onlyGovernance {
        require(emergencyWithdrawMode == true, "Cannot withdraw in normal mode");
        IERC20(_token).safeTransfer(governance(), _amount);
    }
    
    // Timelock variables
    
    uint256 private _timelockStart; // The start of the timelock to change governance variables
    uint256 private _timelockType; // The function that needs to be changed
    uint256 constant TIMELOCK_DURATION = 86400; // Timelock is 24 hours
    
    // Reusable timelock variables
    address[2] private _timelock_address;
    uint256[2] private _timelock_data;
    
    modifier timelockConditionsMet(uint256 _type) {
        require(_timelockType == _type, "Timelock not acquired for this function");
        _timelockType = 0; // Reset the type once the timelock is used
        if(balance() > 0){ // Timelock only applies when balance exists
            require(now >= _timelockStart + TIMELOCK_DURATION, "Timelock time not met");
        }
        _;
    }
    
    // Change the owner of the token contract
    // --------------------
    function startGovernanceChange(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 1;
        _timelock_address[0] = _address;       
    }
    
    function finishGovernanceChange() external onlyGovernance timelockConditionsMet(1) {
        transferGovernance(_timelock_address[0]);
    }
    // --------------------
    
    // Change the ba address
    // --------------------
    function startChangeBank(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 2;
        _timelock_address[0] = _address;
    }
    
    function finishChangeBank() external onlyGovernance timelockConditionsMet(2) {
        bankAddress = _timelock_address[0];
    }
    // --------------------
    
    // Change the zsToken address
    // --------------------
    function startChangeZSToken(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 3;
        _timelock_address[0] = _address;
    }
    
    function finishChangeZSToken() external onlyGovernance timelockConditionsMet(3) {
        zsTokenAddress = _timelock_address[0];
    }
    // --------------------
    
    // Change the strategy allocations between the parties
    // --------------------
    
    function startChangeStrategyAllocations(uint256 _pDepositors, uint256 _pFlashDeposit) external onlyGovernance {
        // Changes strategy allocations in one call
        require(_pDepositors <= 100000,"Percent cannot be greater than 100%");
        _timelockStart = now;
        _timelockType = 4;
        _timelock_data[0] = _pDepositors;
        _timelock_data[1] = _pFlashDeposit;
    }
    
    function finishChangeStrategyAllocations() external onlyGovernance timelockConditionsMet(4) {
        percentDepositor = _timelock_data[0];
        percentFlashDepositor = _timelock_data[1];
    }
    // --------------------

    // Add a new Impermax token vault
    // --------------------
    
    function startAddNewImpermaxVault(address poolID, address mintToken) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 5;
        _timelock_address[0] = poolID;
        _timelock_address[1] = mintToken;
    }
    
    function finishAddNewImpermaxVault() external onlyGovernance timelockConditionsMet(5) {
        rebalance(governance());
        address _mintable = address(_timelock_address[1]);
        VaultList.push(
            VaultInfo({
                vaultID: address(_timelock_address[0]),
                mintableToken: _mintable,
                lastExchangeRate: ImpermaxToken(_mintable).exchangeRateLast()
            })
        );
    }
    // --------------------

    // Going into emergency withdraw mode
    // --------------------
    function startActivateEmergencyWithdrawMode() external onlyGovernance {
        _timelockStart = now;
        _timelockType = 6;
    }
    
    function finishActivateEmergencyWithdrawMode() external onlyGovernance timelockConditionsMet(6) {
        emergencyWithdrawMode = true;
    }
    // --------------------

}