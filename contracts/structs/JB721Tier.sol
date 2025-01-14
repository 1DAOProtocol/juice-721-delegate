// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

/**
  @member id The tier's ID.
  @member price The price that must be paid to qualify for this tier.
  @member remainingQuantity Remaining number of tokens in this tier. Together with idCeiling this enables for consecutive, increasing token ids to be issued to contributors.
  @member initialQuantity The initial `remainingAllowance` value when the tier was set.
  @member votingUnits The amount of voting significance to give this tier compared to others.
  @member reservedRate The number of minted tokens needed in the tier to allow for minting another reserved token.
  @member reservedRateBeneficiary The beneificary of the reserved tokens for this tier.
  @member encodedIPFSUri The URI to use for each token within the tier.
  @member category A category to group NFT tiers by.
  @member allowManualMint A flag indicating if the contract's owner can mint from this tier on demand.
  @member transfersPausable A flag indicating if transfers from this tier can be pausable. 
  @member resolvedTokenUri A resolved token URI if a resolver is included for the NFT to which this tier belongs.
*/
struct JB721Tier {
  uint256 id;
  uint256 price;
  uint256 remainingQuantity;
  uint256 initialQuantity;
  uint256 votingUnits;
  uint256 reservedRate;
  address reservedTokenBeneficiary;
  bytes32 encodedIPFSUri;
  uint256 category;
  bool allowManualMint;
  bool transfersPausable;
  string resolvedUri;
}
