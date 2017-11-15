// Quantstamp Technologies Inc. (info@quantstamp.com)

pragma solidity ^0.4.15;

import '../QuantstampMainSale.sol';

/**
 * The QuantstampSale smart contract is used for selling QuantstampToken
 * tokens (QSP). It does so by converting ETH received into a quantity of
 * tokens that are transferred to the contributor via the ERC20-compatible
 * transferFrom() function.
 */
contract QuantstampSaleMock is QuantstampMainSale {

    uint public _now;

    function QuantstampSaleMock(
        address ifSuccessfulSendTo,
        uint fundingCapInEthers,
        uint minimumContributionInWei,
        uint start,
        uint durationInMinutes,
        uint initialCap,
        uint capDurationInMinutes,
        address addressOfTokenUsedAsReward
    ) QuantstampMainSale(ifSuccessfulSendTo, fundingCapInEthers,
                     minimumContributionInWei, start, durationInMinutes,
                     initialCap, capDurationInMinutes, addressOfTokenUsedAsReward){
        _now = start + 1;
    }

    function currentTime() constant returns (uint) {
        return _now;
    }

    event HitLine(uint key, uint val);
    function changeTime(uint _newTime) onlyOwner external {
        HitLine(123, _newTime);
        _now = _newTime;
    }
}
