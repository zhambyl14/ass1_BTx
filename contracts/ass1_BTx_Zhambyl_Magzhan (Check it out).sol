// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MGNToken is ERC20 {
    address public admin;
    uint256 public constant INITIAL_SUPPLY = 2000 * 10**18;

    constructor() ERC20("AITU_MAGZHAN", "MGN") {
        _mint(msg.sender, INITIAL_SUPPLY);
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, 'Only admin');
        _;
    }

    function mint(address to, uint256 amount) external onlyAdmin {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    event TransactionInfo(address indexed sender, address indexed receiver, uint256 value, string timestamp);

    function getLatestTransactionTimestamp() external view returns (string memory) {
        return toDate(block.timestamp);
    }

    function getTransactionSender() external view returns (address) {
        return _msgSender();
    }

    function getTransactionReceiver() external view returns (address) {
        // Placeholder logic, customize as per your use case
        return address(this);
    }

    function toDate(uint256 value) internal pure returns (string memory) {
        string memory day = uint256ToString(toDay(value));
        string memory month = uint256ToString(toMonth(value));
        string memory year = uint256ToString(toYear(value));

        return string(abi.encodePacked(day, "/", month, "/", year));
    }

    function toYear(uint256 value) internal pure returns (uint) {
        uint256 secs = value / 4;
        return 3 * secs / (365 * 24 * 60 * 60) + secs / (366 * 24 * 60 * 60) + 1971;
    }

    function toDay(uint256 value) internal pure returns (uint) {
        uint256 year = toYear(value);
        uint256 daysInYear = year % 4 == 0 ? 366 : 365;
        uint256 reminder = value / (60 * 60 * 24);
        return reminder - (year - 1970) * daysInYear - 12;
    }

    function toMonth(uint256 value) internal pure returns (uint) {
        uint256 year = toYear(value);
        uint256 daysInYear = year % 4 == 0 ? 366 : 365;
        uint256 day = toDay(value);

        if (day <= 31) return 1;
        if (day <= 59 && daysInYear == 365) return 2;
        if (day <= 60 && daysInYear == 366) return 2;
        if (day <= 90 && daysInYear == 365) return 3;
        if (day <= 91 && daysInYear == 366) return 3;
        if (day <= 120 && daysInYear == 365) return 4;
        if (day <= 121 && daysInYear == 366) return 4;
        if (day <= 151 && daysInYear == 365) return 5;
        if (day <= 152 && daysInYear == 366) return 5;
        if (day <= 181 && daysInYear == 365) return 6;
        if (day <= 182 && daysInYear == 366) return 6;
        if (day <= 212 && daysInYear == 365) return 7;
        if (day <= 213 && daysInYear == 366) return 7;
        if (day <= 243 && daysInYear == 365) return 8;
        if (day <= 244 && daysInYear == 366) return 8;
        if (day <= 273 && daysInYear == 365) return 9;
        if (day <= 274 && daysInYear == 366) return 9;
        if (day <= 304 && daysInYear == 365) return 10;
        if (day <= 305 && daysInYear == 366) return 10;
        if (day <= 334 && daysInYear == 365) return 11;
        if (day <= 335 && daysInYear == 366) return 11;
        return 12;
    }

    function uint256ToString(uint256 value) internal pure returns (string memory) {
        if (value == 0) return "0";

        uint256 temp = value;
        uint256 digits;

        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        bytes memory buffer = new bytes(digits);

        while (value != 0) {
            digits--;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }

        return string(buffer);
    }
}
