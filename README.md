# Circuit Breaker | Chainlink Automation

## I. About

The Circuit Breaker contract is a highly configurable proof of concept that can be used with any OCR price feed. It is capable of emitting events or calling custom functions based on predefined conditions, and it comes with an interactive UI that allows users to easily configure and manage the contract.

## II. How it works

The ExampleImplementation contract can utilize utilize a Chainlink price feed address the BTC/USD price feed on your desired and pass in a value called maxBalance which is the threshold at which the circuit breaker is triggered.. If that limit is breached, and if the “circuit broken” flag is not already set to true, then it performs the upkeep which will increment a counter or bre replaced with your desired logic. 

The “circuit broken” flag is set in performUpkeep — this is to prevent it from keep tripping the circuit again and again. This is checked in the isFeedParamsMet ? logic so that performUpkeep is not even triggered if the circuit is already broken (even if the price feed answer > max ). The “circuit broken” flag can be reset to “false” and the max limit can also be reset to change to a different level.


## II. How to utilize the Example

1. Deploy the ExampleImplementation.sol and CircuitBreaker.sol contracts on your desired chain. Save the contract for them both.
2. Go to https://automation.chain.link/ and click Register new Upkeep.
3. Select custom logic and for Target contract address, enter the address of CircuitBreaker.sol
4. Fill in the rest of the field as desired, however, In the Check Data field - pass in the address of the ExampleImplementation.sol contract.
5. Register and fund your upkeep.

Now the Chainlink Automation network will watch your contract for these trigger parameters. If the price from the feed you provided is above the maxBalance threshold that was specified, the executeEmergencyAction() function will trigger.

> :warning: **Disclaimer**: This repository represents an example of using a Chainlink product or service and is provided to help you understand how to interact with Chainlink’s systems and services so that you can integrate them into your own. This template is provided “AS IS” and “AS AVAILABLE” without warranties of any kind, has not been audited, and may be missing key checks or error handling to make the usage of the product more clear. Do not use the code in this example in a production environment without completing your own audits and application of best practices. Neither Chainlink Labs, the Chainlink Foundation, nor Chainlink node operators are responsible for unintended outputs that are generated due to errors in code.