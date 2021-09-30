pragma solidity ^0.5.16;

// https://docs.synthetix.io/contracts/source/interfaces/IExchangeRatesCircuitBreaker
interface IExchangeRatesCircuitBreaker {
    // Views

    function isSynthRateInvalid(bytes32 currencyKey) external view returns (bool);

    function priceDeviationThresholdFactor() external view returns (uint);

    function isDeviationAboveThreshold(uint base, uint comparison) external view returns (bool);

    function lastExchangeRate(bytes32 currencyKey) external view returns (uint);

    // Mutative functions

    function setLastExchangeRateForSynth(bytes32 currencyKey, uint rate) external;

    function resetLastExchangeRate(bytes32[] calldata currencyKeys) external;

    function suspendIfRateInvalid(bytes32 currencyKey) external returns (bool circuitBroken);
}
