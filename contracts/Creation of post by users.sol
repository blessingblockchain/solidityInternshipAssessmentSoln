// SPDX-Licensce-Identifier: MIT
pragma solidity ^0.8.0;

contract Post {
    
    struct PostStruct {
        uint256 id;
        address author;
        string content;
        string title;
        bool deleted;
    }
    
    PostStruct[] private posts;
    
    mapping (address => uint256[]) private userPosts;
    
    event PostCreated(uint256 id, address author, string content, string title);
    event PostEdited(uint256 id, string content, string title);
    event PostDeleted(uint256 id);
    
    function createPost(string memory _content, string memory _title) public {
        uint256 newId = posts.length;
        PostStruct memory newPost = PostStruct({
            id: newId,
            author: msg.sender,
            content: _content,
            title: _title,
            deleted: false
        });
        posts.push(newPost);
        userPosts[msg.sender].push(newId);
        emit PostCreated(newId, msg.sender, _content, _title);
    }
    
    function editPost(uint256 id, string memory _content, string memory _title) public {
        require(posts[id].author == msg.sender, "Unauthorized edit");
        require(posts[id].deleted == false, "Post deleted");
        posts[id].content = _content;
        posts[id].title = _title;
        emit PostEdited(id, _content, _title);
    }
    
    function deletePost(uint256 id) public {
        require(posts[id].author == msg.sender, "Unauthorized delete");
        require(posts[id].deleted == false, "Post already deleted");
        posts[id].deleted = true;
        emit PostDeleted(id);
    }
    
    function getPost(uint256 id) public view returns (address author, string memory content, string memory title) {
        require(posts[id].deleted == false, "Post deleted");
        return (posts[id].author, posts[id].content, posts[id].title);
    }
    
    function getLatestPosts(uint256 count) public view returns (uint256[] memory ids) {
        uint256 startIndex;
        if (posts.length > count) {
            startIndex = posts.length - count;
        } else {
            startIndex = 0;
        }
        ids = new uint256[](posts.length - startIndex);
        uint256 j = 0;
        for (uint256 i = startIndex; i < posts.length; i++) {
            if (!posts[i].deleted) {
                ids[j] = i;
                j++;
            }
        }
        return ids;
    }
    
    function getUserPosts(address userAddress) public view returns (uint256[] memory ids) {
        ids = new uint256[](userPosts[userAddress].length);
        uint256 j = 0;
        for (uint256 i = 0; i < userPosts[userAddress].length; i++) {
            uint256 id = userPosts[userAddress][i];
            if (!posts[id].deleted) {
                ids[j] = id;
                j++;
            }
        }
        return ids;
    }
}
