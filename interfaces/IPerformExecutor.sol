// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPerformExecutor {

  event emergencyActionPerformed(uint counter);

  function getCount() external view returns (uint);

  function isEmergencyActionPossible() external view returns (bool);

  function isFeedParamMet() external view returns (bool);

  function executeEmergencyAction() external;
}