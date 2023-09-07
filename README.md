# Circuit Breaker | Chainlink Automation

## I. About

This repository contains example contracts of an implementation of a circuit breaker that can be used with any OCR price feed. It is possible to monitor a given contract, specify the price when the circuit breaker will be triggered based on predefined conditions, and then underlying logic of what happens when the circuit breaker is triggered.

## II. How it works

The ExampleImplementation contract can utilize utilize a Chainlink price feed address the BTC/USD price feed on your desired and pass in a value called maxBalance which is the threshold at which the circuit breaker is triggered.. If that limit is breached, and if the “circuit broken” flag is not already set to true, then it performs the upkeep which will increment a counter or can be replaced with your desired logic. 

The “circuit broken” flag is set in performUpkeep — this is to prevent it from keep tripping the circuit again and again. This is checked in the isFeedParamsMet ? logic so that performUpkeep is not even triggered if the circuit is already broken (even if the price feed answer > max ). The “circuit broken” flag can be reset to “false” and the max limit can also be reset to change to a different level.


## II. How to utilize the Example

1. Deploy the ExampleImplementation.sol - while deploying this, the constructor will expect the proxy contract address of the price feed (example: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43), the maxBalance (example: 3000000000000 ) and “isEmergencyPossible” flag (which could be set to true if you want the circuit breaking condition to be checked; this allows for this to be turned OFF with false if needed)
2. Deploy the CircuitBreaker.sol
3. Go to https://automation.chain.link/ and click Register new Upkeep.
4. Select custom logic and for Target contract address, enter the address of CircuitBreaker.sol
5. Fill in the rest of the field as desired, however, In the Check Data field - pass in the address of the ExampleImplementation.sol contract. Note: Use abi.encode this contract address with a 0x in the beginning before entering it as checkData
6. Register and fund your upkeep.

Now the Chainlink Automation network will watch your contract for these trigger parameters. If the price from the feed you provided is above the maxBalance threshold that was specified, the executeEmergencyAction() function will trigger.

> :warning: **Disclaimer**: This repository represents an example of using a Chainlink product or service and is provided to help you understand how to interact with Chainlink’s systems and services so that you can integrate them into your own. This template is provided “AS IS” and “AS AVAILABLE” without warranties of any kind, has not been audited, and may be missing key checks or error handling to make the usage of the product more clear. Do not use the code in this example in a production environment without completing your own audits and application of best practices. Neither Chainlink Labs, the Chainlink Foundation, nor Chainlink node operators are responsible for unintended outputs that are generated due to errors in code.
