// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626RobinhoodMorphoSteakhouseUSDGTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "robinhood";
        forkState.blockNumber = 81646459;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's Steakhouse USDG
        erc4626State.wrapper = IERC4626(0xBeEff033F34C046626B8D0A041844C5d1A5409dd);
        // Donor of USDG tokens (Morpho, ~55M USDG of idle market liquidity)
        erc4626State.underlyingDonor = 0x9D53d5E3bd5E8d4Cbfa6DB1ca238AEA02E651010;
        erc4626State.amountToDonate = 1e5 * 1e6;
        erc4626State.skipMaxTests = true;
    }
}
