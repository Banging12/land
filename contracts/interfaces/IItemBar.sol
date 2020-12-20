pragma solidity ^0.4.24;

interface IItemBar {
	//0x33372e46
	function enhanceStrengthRateOf(
		address _resourceToken,
		uint256 _tokenId
	) external view returns (uint256);

	function maxAmount() external view returns (uint256);

	//0x993ac21a
	function enhanceStrengthRateByIndex(
		address _resourceToken,
		uint256 _landTokenId,
		uint256 _index
	) external view returns (uint256);

	//0x8bed3d77
	function getBarStaker(uint256 _landTokenId, uint256 _index)
		external
		view
		returns (address);
}
