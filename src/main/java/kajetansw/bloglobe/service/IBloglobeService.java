package kajetansw.bloglobe.service;

import java.util.List;

import kajetansw.bloglobe.entity.Post;

public interface IBloglobeService {
	public List<Post> getPosts();

	public void savePost(Post thePost);
}
