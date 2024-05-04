// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

interface IERC4908 {

    /// @notice Allows content access NFT to be minted
    /// @dev This function is meant to be called by the content author
    /// @param contentId The content identification from the off-chain content service provider
    /// @param price The mint price, in other terms the access price for this particular content
    /// @param expirationTime The expiration time of the access
    function setAccess(uint256 contentId, uint256 price, uint32 expirationTime) external;

    /// @notice Disallows content access NFT to be minted, the remaining NFTs can still be used
    /// @dev This function is meant to be called by the content author
    /// @param contentId The content identification from the off-chain content service provider
    function delAccess(uint256 contentId) external;

    /// @notice Mints a content access NFT
    /// @dev This function is meant to be called by the content consumer
    /// @param author address hashed with contentId to retrieve the content settings specified by the author
    /// @param contentId The content identification from the off-chain content service provider
    /// @param to The address of the content consumer
    function mint(address author, uint256 contentId, address to) external;

    /// @notice Check for the access to a particular content from a particular consumer
    /// @dev This function is meant to be called by the content provider, the 2 first parameters
    ///      are meant to certify that the content ID is owned by the author while the last
    ///      `consumer` parameter is used to find if the consumer owns an NFT for this content
    ///      that is not expired.
    /// @param author The address of the content author
    /// @param contentId The content identification from the off-chain content service provider
    /// @param consumer The address of the content consumer
    /// @return bool True if the consumer has access to the content, false otherwise
    function hasAccess(address author, uint256 contentId, address consumer) external view returns (bool);
}