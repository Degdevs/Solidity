// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

// here we create the contract and give it all the functions and variables of the SimpleStorage contract
contract StorageFactory is SimpleStorage {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // the _simpleStorageIndex is for choosing wich SimpleStorage contract we are going to use
    // in this function we store a favoriteNumber into a contract
    function sfSimpleStorage(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address and store a fav number
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }

    // in this function we get the favoriteNumber that we stored in a contract
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }

}
