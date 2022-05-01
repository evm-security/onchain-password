// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract onChainPassword
{
    bytes32 private globalPassword;
    event passwordCheck(bool _decision);
    event newPassword();

    constructor(bytes32 _hashedPassword) 
    {
        globalPassword = _hashedPassword;
    }

    function _checkPassword(bytes32 _password, bytes32 _newPassword)
        public returns (bool, bytes32, bytes32)
    {
        if(keccak256(abi.encodePacked(_password))==globalPassword)
        {
            _setNewPassword(_newPassword);
            emit passwordCheck(true);
            return (true, _password, _newPassword);
        }

        else
        {
            emit passwordCheck(false);
            return (false, _password, _newPassword);
        }
    }

    function _setNewPassword(bytes32 _newPassword) internal
    {
        require(_newPassword!=globalPassword, "Enter a new password");
        globalPassword = _newPassword;
        emit newPassword();
    }

    // function constructorGet() public view returns (string memory)
    // {
    //     return string(abi.encodePacked(globalPassword));
    // }
}