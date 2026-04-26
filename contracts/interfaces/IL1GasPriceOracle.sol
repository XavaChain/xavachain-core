// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IL1GasPriceOracle {
    function getL1Fee(bytes calldata _data) external view returns (uint256 fee);

    function getL1GasUsed(bytes calldata _data) external view returns (uint256 gasUsed);

    function getFeeBreakdown(bytes calldata _data)
        external
        view
        returns (
            uint256 l1Fee,
            uint256 l1GasUsed,
            uint256 l1Price,
            uint256 currentScalar,
            uint256 currentRatio
        );

    function getEffectiveL1Price() external view returns (uint256);

    function getOracleData()
        external
        view
        returns (
            uint256 _l1BaseFee,
            uint256 _l1BlobBaseFee,
            uint256 _scalar,
            uint256 _compressionRatio,
            uint256 _lastUpdateBlock,
            bool _useBlobPricing
        );
}

