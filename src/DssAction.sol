// SPDX-License-Identifier: AGPL-3.0-or-later
//
// DssAction.sol -- DSS Executive Spell Actions
//
// Copyright (C) 2020 Maker Ecosystem Growth Holdings, Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity ^0.6.7;

// https://github.com/makerdao/dss-chain-log
interface ChainlogLike {
    function getAddress(bytes32) external view returns (address);
}

interface RegistryLike {
    function ilkData(bytes32) external returns (
        uint256       pos,
        address       gem,
        address       pip,
        address       join,
        address       flip,
        uint256       dec,
        string memory name,
        string memory symbol
    );
}

contract DssAction {

    address public immutable lib;

    // Changelog address applies to MCD deployments on
    //        mainnet, kovan, rinkeby, ropsten, and goerli
    address constant public LOG = 0xdA0Ab1e0017DEbCd72Be8599041a2aa3bA7e740F;

    constructor(address lib_) public {
        lib = lib_;
    }

    /****************************/
    /*** Core Address Helpers ***/
    /****************************/
    function vat()        public view returns (address) { return getChangelogAddress("MCD_VAT"); }
    function cat()        public view returns (address) { return getChangelogAddress("MCD_CAT"); }
    function jug()        public view returns (address) { return getChangelogAddress("MCD_JUG"); }
    function pot()        public view returns (address) { return getChangelogAddress("MCD_POT"); }
    function vow()        public view returns (address) { return getChangelogAddress("MCD_VOW"); }
    function end()        public view returns (address) { return getChangelogAddress("MCD_END"); }
    function reg()        public view returns (address) { return getChangelogAddress("ILK_REGISTRY"); }
    function spot()       public view returns (address) { return getChangelogAddress("MCD_SPOT"); }
    function flap()       public view returns (address) { return getChangelogAddress("MCD_FLAP"); }
    function flop()       public view returns (address) { return getChangelogAddress("MCD_FLOP"); }
    function osmMom()     public view returns (address) { return getChangelogAddress("OSM_MOM"); }
    function govGuard()   public view returns (address) { return getChangelogAddress("GOV_GUARD"); }
    function flipperMom() public view returns (address) { return getChangelogAddress("FLIPPER_MOM"); }

    function getChangelogAddress(bytes32 _key) public view returns (address) {
        return ChainlogLike(LOG).getAddress(_key);
    }

    function flip(bytes32 _ilk) public returns (address) {
        (,,,, address _flip,,,) = RegistryLike(reg()).ilkData(_ilk);
        return _flip;
    }

    function _dcall(bytes memory data) internal {
        (bool ok,) = lib.delegatecall(data);
        require(ok, "fail");
    }

    function libCall(string memory sig, address addr, address addr2) internal {
        _dcall(abi.encodeWithSignature(sig, addr, addr2));
    }

    function libCall(string memory sig, address addr, bytes32 what, address addr2) internal {
        _dcall(abi.encodeWithSignature(sig, addr, what, addr2));
    }

    function libCall(string memory sig, address addr, bytes32 what, bytes32 what2, address addr2) internal {
        _dcall(abi.encodeWithSignature(sig, addr, what, what2, addr2));
    }

    function libCall(string memory sig, address addr, address[] memory arr) internal {
        _dcall(abi.encodeWithSignature(sig, addr, arr));
    }

    function libCall(string memory sig, string memory what) internal {
        _dcall(abi.encodeWithSignature(sig, what));
    }

    function libCall(string memory sig, bytes32 what, uint256 num) internal {
        _dcall(abi.encodeWithSignature(sig, what, num));
    }

    function libCall(string memory sig, bytes32 what, address addr) internal {
        _dcall(abi.encodeWithSignature(sig, what, addr));
    }

    function libCall(string memory sig, address mcd_addr) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr));
    }

    function libCall(string memory sig, address mcd_addr, uint256 num) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, num));
    }

    function libCall(string memory sig, address mcd_addr, bytes32 what) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, what));
    }

    function libCall(string memory sig, address mcd_addr, string memory what) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, what));
    }

    function libCall(string memory sig, address mcd_addr, address addr, bytes32 what) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, addr, what));
    }

    function libCall(string memory sig, address mcd_addr, bytes32 what, uint256 num) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, what, num));
    }

    function libCall(string memory sig, address mcd_addr, bytes32 what, uint256 num, bool bool1) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, what, num, bool1));
    }

    function libCall(string memory sig, address mcd_addr, address mcd_addr2, address addr, address addr2) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, mcd_addr2, addr, addr2));
    }

    function libCall(string memory sig, address mcd_addr, address mcd_addr2, address mcd_addr3, address addr, address addr2) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, mcd_addr2, mcd_addr3, addr, addr2));
    }

    function libCall(string memory sig, address mcd_addr, address mcd_addr2, address mcd_addr3, address mcd_addr4, bytes32 what, address addr, address addr2) internal {
        _dcall(abi.encodeWithSignature(sig, mcd_addr, mcd_addr2, mcd_addr3, mcd_addr4, what, addr, addr2));
    }

    function libCall(
        string memory sig,
        bytes32 what,
        address[] memory arr,
        bool    bool1,
        bool[] memory bools,
        uint256 num1,
        uint256 num2,
        uint256 num3,
        uint256 num4,
        uint256 num5,
        uint256 num6,
        uint256 num7,
        uint256 num8,
        uint256 num9
    ) internal {
        _dcall(abi.encodeWithSignature(sig, what, arr, bool1, bools, num1, num2, num3, num4, num5, num6, num7, num8, num9));
    }

    /****************************/
    /*** Changelog Management ***/
    /****************************/
    function setChangelogAddress(bytes32 key, address value) internal {
        libCall("setChangelogAddress(address,bytes32,address)", LOG, key, value);
    }

    function setChangelogVersion(string memory version) internal {
        libCall("setChangelogVersion(address,string)", LOG, version);
    }

    function setChangelogIPFS(string memory ipfs) internal {
        libCall("setChangelogIPFS(address,string)", LOG, ipfs);
    }

    function setChangelogSHA256(string memory SHA256) internal {
        libCall("setChangelogSHA256(address,string)", LOG, SHA256);
    }

    /**********************/
    /*** Authorizations ***/
    /**********************/
    function authorize(address base, address ward) internal virtual {
        libCall("authorize(address,address)", base, ward);
    }

    function deauthorize(address base, address ward) internal {
        libCall("deauthorize(address,address)", base, ward);
    }

    /**************************/
    /*** Accumulating Rates ***/
    /**************************/
    function accumulateDSR() internal {
        libCall("accumulateDSR(address)", pot());
    }

    function accumulateCollateralStabilityFees(bytes32 ilk) internal {
        libCall("accumulateCollateralStabilityFees(address,bytes32)", jug(), ilk);
    }

    /*********************/
    /*** Price Updates ***/
    /*********************/
    function updateCollateralPrice(bytes32 ilk) internal {
        libCall("updateCollateralPrice(address,bytes32)", spot(), ilk);
    }

    /****************************/
    /*** System Configuration ***/
    /****************************/
    function setContract(address base, bytes32 what, address addr) internal {
        libCall("setContract(address,bytes32,address)", base, what, addr);
    }

    function setContract(address base, bytes32 ilk, bytes32 what, address addr) internal {
        libCall("setContract(address,bytes32,bytes32,address)", base, ilk, what, addr);
    }

    /******************************/
    /*** System Risk Parameters ***/
    /******************************/
    function setGlobalDebtCeiling(uint256 amount) internal {
        libCall("setGlobalDebtCeiling(address,uint256)", vat(), amount);
    }

    function increaseGlobalDebtCeiling(uint256 amount) internal {
        libCall("increaseGlobalDebtCeiling(address,uint256)", vat(), amount);
    }

    function decreaseGlobalDebtCeiling(uint256 amount) internal {
        libCall("decreaseGlobalDebtCeiling(address,uint256)", vat(), amount);
    }

    function setDSR(uint256 rate) internal {
        libCall("setDSR(address,uint256)", pot(), rate);
    }

    function setSurplusAuctionAmount(uint256 amount) internal {
        libCall("setSurplusAuctionAmount(address,uint256)", vow(), amount);
    }

    function setSurplusBuffer(uint256 amount) internal {
        libCall("setSurplusBuffer(address,uint256)", vow(), amount);
    }

    function setMinSurplusAuctionBidIncrease(uint256 pct_bps) internal {
        libCall("setMinSurplusAuctionBidIncrease(address,uint256)", flap(), pct_bps);
    }

    function setSurplusAuctionBidDuration(uint256 duration) internal {
        libCall("setSurplusAuctionBidDuration(address,uint256)", flap(), duration);
    }

    function setSurplusAuctionDuration(uint256 duration) internal {
        libCall("setSurplusAuctionDuration(address,uint256)", flap(), duration);
    }

    function setDebtAuctionDelay(uint256 duration) internal {
        libCall("setDebtAuctionDelay(address,uint256)", vow(), duration);
    }

    function setDebtAuctionDAIAmount(uint256 amount) internal {
        libCall("setDebtAuctionDAIAmount(address,uint256)", vow(), amount);
    }

    function setDebtAuctionMKRAmount(uint256 amount) internal {
        libCall("setDebtAuctionMKRAmount(address,uint256)", vow(), amount);
    }

    function setMinDebtAuctionBidIncrease(uint256 pct_bps) internal {
        libCall("setMinDebtAuctionBidIncrease(address,uint256)", flop(), pct_bps);
    }

    function setDebtAuctionBidDuration(uint256 duration) internal {
        libCall("setDebtAuctionBidDuration(address,uint256)", flop(), duration);
    }

    function setDebtAuctionDuration(uint256 duration) internal {
        libCall("setDebtAuctionDuration(address,uint256)", flop(), duration);
    }

    function setDebtAuctionMKRIncreaseRate(uint256 pct_bps) internal {
        libCall("setDebtAuctionMKRIncreaseRate(address,uint256)", flop(), pct_bps);
    }

    function setMaxTotalDAILiquidationAmount(uint256 amount) internal {
        libCall("setMaxTotalDAILiquidationAmount(address,uint256)", cat(), amount);
    }

    function setEmergencyShutdownProcessingTime(uint256 duration) internal {
        libCall("setEmergencyShutdownProcessingTime(address,uint256)", end(), duration);
    }

    function setGlobalStabilityFee(uint256 rate) internal {
        libCall("setGlobalStabilityFee(address,uint256)", jug(), rate);
    }

    function setDAIReferenceValue(uint256 value) internal {
        libCall("setDAIReferenceValue(address,uint256)", spot(),value);
    }

    /*****************************/
    /*** Collateral Management ***/
    /*****************************/
    function setIlkDebtCeiling(bytes32 ilk, uint256 amount) internal {
        libCall("setIlkDebtCeiling(address,bytes32,uint256)", vat(), ilk, amount);
    }

    function increaseIlkDebtCeiling(bytes32 ilk, uint256 amount) internal {
        libCall("increaseIlkDebtCeiling(address,bytes32,uint256,bool)", vat(), ilk, amount, true);
    }

    function decreaseIlkDebtCeiling(bytes32 ilk, uint256 amount) internal {
        libCall("decreaseIlkDebtCeiling(address,bytes32,uint256,bool)", vat(), ilk, amount, true);
    }

    function setIlkMinVaultAmount(bytes32 ilk, uint256 amount) internal {
        libCall("setIlkMinVaultAmount(address,bytes32,uint256)", vat(), ilk, amount);
    }

    function setIlkLiquidationPenalty(bytes32 ilk, uint256 pct_bps) internal {
        libCall("setIlkLiquidationPenalty(address,bytes32,uint256)", cat(), ilk, pct_bps);
    }

    function setIlkMaxLiquidationAmount(bytes32 ilk, uint256 amount) internal {
        libCall("setIlkMaxLiquidationAmount(address,bytes32,uint256)", cat(), ilk, amount);
    }

    function setIlkLiquidationRatio(bytes32 ilk, uint256 pct_bps) internal {
        libCall("setIlkLiquidationRatio(address,bytes32,uint256)", spot(), ilk, pct_bps);
    }

    function setIlkMinAuctionBidIncrease(bytes32 ilk, uint256 pct_bps) internal {
        libCall("setIlkMinAuctionBidIncrease(address,uint256)", flip(ilk), pct_bps);
    }

    function setIlkBidDuration(bytes32 ilk, uint256 duration) internal {
        libCall("setIlkBidDuration(address,uint256)", flip(ilk), duration);
    }

    function setIlkAuctionDuration(bytes32 ilk, uint256 duration) internal {
        libCall("setIlkAuctionDuration(address,uint256)", flip(ilk), duration);
    }

    function setIlkStabilityFee(bytes32 ilk, uint256 rate) internal {
        libCall("setIlkStabilityFee(address,bytes32,uint256,bool)", jug(), ilk, rate, true);
    }

    /***********************/
    /*** Core Management ***/
    /***********************/
    function updateCollateralAuctionContract(bytes32 ilk, address newFlip, address oldFlip) internal {
        libCall("updateCollateralAuctionContract(address,address,address,address,bytes32,address,address)", vat(), cat(), end(), flipperMom(), ilk, newFlip, oldFlip);
    }

    function updateSurplusAuctionContract(address newFlap, address oldFlap) internal {
        libCall("updateSurplusAuctionContract(address,address,address,address)", vat(), vow(), newFlap, oldFlap);
    }

    function updateDebtAuctionContract(address newFlop, address oldFlop) internal {
        libCall("updateDebtAuctionContract(address,address,address,address,address)", vat(), vow(), govGuard(), newFlop, oldFlop);
    }

    /*************************/
    /*** Oracle Management ***/
    /*************************/
    function addWritersToMedianWhitelist(address medianizer, address[] memory feeds) internal {
        libCall("addWritersToMedianWhitelist(address,address[])", medianizer, feeds);
    }

    function removeWritersFromMedianWhitelist(address medianizer, address[] memory feeds) internal {
        libCall("removeWritersFromMedianWhitelist(address,address[])", medianizer, feeds);
    }

    function addReadersToMedianWhitelist(address medianizer, address[] memory readers) internal {
        libCall("addReadersToMedianWhitelist(address,address[])", medianizer, readers);
    }

    function addReaderToMedianWhitelist(address medianizer, address reader) internal {
        libCall("addReaderToMedianWhitelist(address,address)", medianizer, reader);
    }

    function removeReadersFromMedianWhitelist(address medianizer, address[] memory readers) internal {
        libCall("removeReadersFromMedianWhitelist(address,address[])", medianizer, readers);
    }

    function removeReaderFromMedianWhitelist(address medianizer, address reader) internal {
        libCall("removeReaderFromMedianWhitelist(address,address)", medianizer, reader);
    }

    function setMedianWritersQuorum(address medianizer, uint256 minQuorum) internal {
        libCall("setMedianWritersQuorum(address,uint256)", medianizer, minQuorum);
    }

    function addReaderToOSMWhitelist(address osm, address reader) internal {
        libCall("addReaderToOSMWhitelist(address,address)", osm, reader);
    }

    function removeReaderFromOSMWhitelist(address osm, address reader) internal {
        libCall("removeReaderFromOSMWhitelist(address,address)", osm, reader);
    }

    function allowOSMFreeze(address osm, bytes32 ilk) internal {
        libCall("allowOSMFreeze(address,address,bytes32)", osmMom(), osm, ilk);
    }

    /*****************************/
    /*** Collateral Onboarding ***/
    /*****************************/
    function addNewCollateral(
        bytes32          ilk,
        address[] memory _addresses,
        bool             liquidatable,
        bool[] memory    oracleSettings,
        uint256          ilkDebtCeiling,
        uint256          minVaultAmount,
        uint256          maxLiquidationAmount,
        uint256          liquidationPenalty,
        uint256          ilkStabilityFee,
        uint256          bidIncrease,
        uint256          bidDuration,
        uint256          auctionDuration,
        uint256          liquidationRatio
    ) internal {
        address[] memory addresses = new address[](12);
        addresses[0] = _addresses[0];
        addresses[1] = _addresses[1];
        addresses[2] = _addresses[2];
        addresses[3] = _addresses[3];
        addresses[4] = vat();
        addresses[5] = cat();
        addresses[6] = jug();
        addresses[7] = end();
        addresses[8] = spot();
        addresses[9] = reg();
        addresses[10] = flipperMom();
        addresses[11] = osmMom();
        libCall(
            "addNewCollateral(bytes32,address[],bool,bool[],uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256)",
            ilk,
            addresses,
            liquidatable,
            oracleSettings,
            ilkDebtCeiling,
            minVaultAmount,
            maxLiquidationAmount,
            liquidationPenalty,
            ilkStabilityFee,
            bidIncrease,
            bidDuration,
            auctionDuration,
            liquidationRatio
        );
    }
}
