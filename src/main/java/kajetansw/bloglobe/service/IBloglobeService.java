package kajetansw.bloglobe.service;

import java.util.List;

import kajetansw.bloglobe.entity.Post;
import kajetansw.bloglobe.entity.User;

public interface IBloglobeService {
	public List<Post> getPosts();

	public void savePost(Post thePost);

	public User getCurrentUser(String currentPrincipalName);

	public Post getPostById(int id);

	public void deletePost(int id);
}
