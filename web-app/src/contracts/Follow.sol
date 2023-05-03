// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
    Allows users to follow other users
 */
contract Follow {
    mapping(address => mapping(address => bool)) private following;
    mapping(address => address[]) private followers;
    mapping(address => uint256) private followerCount;
    mapping(address => address[]) private followings;
    mapping(address => uint256) private followingCount;

    event Followed(address follower, address followed);
    event Unfollowed(address follower, address unfollowed);

    function follow(address _followed) public {
        require(_followed != address(0), "Invalid address");
        require(following[msg.sender][_followed] == false, "Already following");
        following[msg.sender][_followed] = true;
        followers[_followed].push(msg.sender);
        followerCount[_followed]++;
        followings[msg.sender].push(_followed);
        followingCount[msg.sender]++;
        emit Followed(msg.sender, _followed);
    }

    function unfollow(address _unfollowed) public {
        require(_unfollowed != address(0), "Invalid address");
        require(following[msg.sender][_unfollowed] == true, "Not following");
        following[msg.sender][_unfollowed] = false;
        uint256 i;
        for (i = 0; i < followers[_unfollowed].length; i++) {
            if (followers[_unfollowed][i] == msg.sender) {
                break;
            }
        }
        for (uint256 j = i; j < followers[_unfollowed].length - 1; j++) {
            followers[_unfollowed][j] = followers[_unfollowed][j + 1];
        }
        followers[_unfollowed].pop();
        followerCount[_unfollowed]--;
        for (i = 0; i < followings[msg.sender].length; i++) {
            if (followings[msg.sender][i] == _unfollowed) {
                break;
            }
        }
        for (uint256 j = i; j < followings[msg.sender].length - 1; j++) {
            followings[msg.sender][j] = followings[msg.sender][j + 1];
        }
        followings[msg.sender].pop();
        followingCount[msg.sender]--;
        emit Unfollowed(msg.sender, _unfollowed);
    }

    function isFollowing(
        address _follower,
        address _followed
    ) public view returns (bool) {
        return following[_follower][_followed];
    }

    function getFollowers(
        address _user
    ) public view returns (address[] memory) {
        return followers[_user];
    }

    function getFollowing(
        address _user
    ) public view returns (address[] memory) {
        return followings[_user];
    }

    function getFollowerCount(address _user) public view returns (uint256) {
        return followerCount[_user];
    }

    function getFollowingCount(address _user) public view returns (uint256) {
        return followingCount[_user];
    }
}
