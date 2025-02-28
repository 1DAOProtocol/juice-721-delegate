// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@jbx-protocol/juice-contracts-v3/contracts/interfaces/IJBDirectory.sol';
import '@jbx-protocol/juice-contracts-v3/contracts/interfaces/IJBFundingCycleStore.sol';
import '@jbx-protocol/juice-contracts-v3/contracts/interfaces/IJBPrices.sol';
import './../structs/JB721PricingParams.sol';
import './../structs/JB721TierParams.sol';
import './../structs/JBTiered721MintReservesForTiersData.sol';
import './../structs/JBTiered721MintForTiersData.sol';
import './IJB721Delegate.sol';
import './IJBTiered721DelegateStore.sol';

interface IJBTiered721Delegate is IJB721Delegate {
  event Mint(
    uint256 indexed tokenId,
    uint256 indexed tierId,
    address indexed beneficiary,
    uint256 totalAmountContributed,
    address caller
  );

  event MintReservedToken(
    uint256 indexed tokenId,
    uint256 indexed tierId,
    address indexed beneficiary,
    address caller
  );

  event AddTier(uint256 indexed tierId, JB721TierParams data, address caller);

  event RemoveTier(uint256 indexed tierId, address caller);

  event SetDefaultReservedTokenBeneficiary(address indexed beneficiary, address caller);

  event SetEncodedIPFSUri(uint256 indexed tierId, bytes32 encodedIPFSUri, address caller);

  event SetBaseUri(string indexed baseUri, address caller);

  event SetContractUri(string indexed contractUri, address caller);

  event SetTokenUriResolver(IJBTokenUriResolver indexed newResolver, address caller);

  event AddCredits(
    uint256 indexed changeAmount,
    uint256 indexed newTotalCredits,
    address indexed account,
    address caller
  );

  event UseCredits(
    uint256 indexed changeAmount,
    uint256 indexed newTotalCredits,
    address indexed account,
    address caller
  );

  function codeOrigin() external view returns (address);

  function store() external view returns (IJBTiered721DelegateStore);

  function fundingCycleStore() external view returns (IJBFundingCycleStore);
  
  function pricingContext() external view returns (uint256, uint256, IJBPrices);

  function creditsOf(address _address) external view returns (uint256);

  function firstOwnerOf(uint256 _tokenId) external view returns (address);

  function baseURI() external view returns (string memory);

  function contractURI() external view returns (string memory);

  function adjustTiers(
    JB721TierParams[] memory _tierDataToAdd,
    uint256[] memory _tierIdsToRemove
  ) external;

  function mintReservesFor(
    JBTiered721MintReservesForTiersData[] memory _mintReservesForTiersData
  ) external;

  function mintReservesFor(uint256 _tierId, uint256 _count) external;

  function mintFor(
    uint16[] calldata _tierIds,
    address _beneficiary
  ) external returns (uint256[] memory tokenIds);

  function setMetadata(
    string memory _baseUri,
    string calldata _contractMetadataUri,
    IJBTokenUriResolver _tokenUriResolver,
    uint256 _encodedIPFSUriTierId,
    bytes32 _encodedIPFSUri
  ) external;

  function initialize(
    uint256 _projectId,
    IJBDirectory _directory,
    string memory _name,
    string memory _symbol,
    IJBFundingCycleStore _fundingCycleStore,
    string memory _baseUri,
    IJBTokenUriResolver _tokenUriResolver,
    string memory _contractUri,
    JB721PricingParams memory _pricing,
    IJBTiered721DelegateStore _store,
    JBTiered721Flags memory _flags
  ) external;
}
