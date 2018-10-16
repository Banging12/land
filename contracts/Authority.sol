pragma solidity ^0.4.24;

import "@evolutionland/common/contracts/interfaces/IAuthority.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Authority is Ownable, IAuthority {

    mapping (address => bool) public whiteList;

    function setWhitelist(address _address, bool _flag) public onlyOwner {
        whiteList[_address] = _flag;
    }

    function canCall(
        address _src, address _dst, bytes4 _sig
    ) public view returns (bool) {
        return ( whiteList[_src] && _sig == bytes4(keccak256("mintObject(address,uint128)")) ) ||
            ( whiteList[_src] && _sig == bytes4(keccak256("burnObject(address,uint128)")) ) ||
            ( whiteList[_src] && _sig == bytes4(keccak256("setTokenLocation100M(uint256,int256,int256)"))) ||
            ( whiteList[_src] && _sig == bytes4(keccak256("modifyResourceRate(uint256,address,uint16"))) ||
            ( whiteList[_src] && _sig == bytes4(keccak256("setHasBox(uint256,bool)")));
    }
}