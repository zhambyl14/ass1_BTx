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

    function toYear(uint256 value) internal pure returns (uint y) {
        uint256 secs = value / 4;
        uint256 yea = 3 * secs / (365 * 24 * 60 * 60) + secs / (366 * 24 * 60 * 60) + 1971;
        //uint256 year = secs / (60 * 60 * 24 * 365) + 1970;
        return yea;
    }
    function toDay(uint256 value) internal pure returns (uint y) {
        uint256 year = toYear(value);
        uint256 yea = year - 1970;
        uint256 reminder = value / (60 * 60 * 24);
        uint256 i = 0;
        if(year % 4 == 0) {
            i = 365;
        }
        else {
            i = 364;
        }
        uint256 day = reminder - (yea * i) - 12;
        return day;
    }
    function toMonth(uint256 value) internal pure returns (uint y) {
        uint256 year = toYear(value);
        uint256 i = 0;
        if(year % 4 == 0) {
            i = 366;
        }
        else {
            i = 365;
        }
        uint256 day = toDay(value);
        uint256 month = 0;
        if (day <= 31) {
            month = 1;
        }
        else if (day <= 59 && i == 365) {
            month = 2;
        }
        else if (day <= 60 && i == 366) {
            month = 2;
        }

        else if (day <= 90 && i == 365) {
            month = 3;
        }
        else if (day <= 91 && i == 366) {
            month = 3;
        }

        else if (day <= 120 && i == 365) {
            month = 4;
        }
        else if (day <= 121 && i == 366) {
            month = 4;
        }

        else if (day <= 151 && i == 365) {
            month = 5;
        }
        else if (day <= 152 && i == 366) {
            month = 5;
        }

        else if (day <= 181 && i == 365) {
            month = 6;
        }
        else if (day <= 182 && i == 366) {
            month = 6;
        }

        else if (day <= 212 && i == 365) {
            month = 7;
        }
        else if (day <= 213 && i == 366) {
            month = 7;
        }

        else if (day <= 243 && i == 365) {
            month = 8;
        }
        else if (day <= 244 && i == 366) {
            month = 8;
        }

        else if (day <= 273 && i == 365) {
            month = 9;
        }
        else if (day <= 274 && i == 366) {
            month = 9;
        }

        else if (day <= 304 && i == 365) {
            month = 10;
        }
        else if (day <= 305 && i == 366) {
            month = 10;
        }

        else if (day <= 334 && i == 365) {
            month = 11;
        }
        else if (day <= 335 && i == 366) {
            month = 11;
        }

        else if (day <= 365 && i == 365) {
            month = 12;
        }
        else if (day <= 366 && i == 366) {
            month = 12;
        }
        
        return month;
    }
    
    function toDate(uint256 value) internal pure returns (string memory) {
    string memory day = uint256ToString(toDay(value));
    string memory month = uint256ToString(toMonth(value));
    string memory year = uint256ToString(toYear(value));

    return string(abi.encodePacked(day, "/", month, "/", year));
}
function uint256ToString(uint256 value) internal pure returns (string memory) {
    if (value == 0) {
        return "0";
    }
    
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
