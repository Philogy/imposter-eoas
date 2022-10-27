// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

/// @author Philippe Dumonet <https://github.com/philogy>
library LibAssetIAs {
    // Huff code (empty body return removed): `../asset-gettooors/ERC20Getter.huff`
    bytes32 internal constant GETTER_CODE_ERC20_1_2 =
        0x60208038033d393d516370a082313d5260203081;
    bytes32 internal constant GETTER_CODE_ERC20_2_2 =
        0x5260406024601c845afa63a9059cbb600052336020526044601c600080945af1;
    uint256 internal constant GETTER_CODE_ERC20_OFFSET = 0x0c;
    uint256 internal constant GETTER_CODE_ERC20_SIZE = 0x54;

    function getERC20Addr(
        address _creator,
        address _token,
        bytes32 _salt
    ) internal pure returns (address erc20Addr) {
        assembly {
            let freeMem := mload(0x40)

            // prepare init code preimage
            mstore(0x00, GETTER_CODE_ERC20_1_2)
            mstore(0x20, GETTER_CODE_ERC20_2_2)
            mstore(0x40, _token)

            // prepare create2 prediction preimage
            mstore(
                0x40,
                keccak256(GETTER_CODE_ERC20_OFFSET, GETTER_CODE_ERC20_SIZE)
            )
            mstore(0x20, _salt)
            mstore(0x00, _creator)
            mstore8(0x0b, 0xff)

            erc20Addr := keccak256(0x0b, 0x55)

            mstore(0x40, freeMem)
        }
    }
}
