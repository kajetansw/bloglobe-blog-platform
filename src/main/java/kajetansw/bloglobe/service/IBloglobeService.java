package kajetansw.bloglobe.service;

import java.util.List;

import kajetansw.bloglobe.entity.BGUser;
import kajetansw.bloglobe.entity.Post;

public interface IBloglobeService {
	public List<Post> getPosts();

	public void savePost(Post thePost);

	public BGUser getCurrentUser(String currentPrincipalName);

	public Post getPostById(int id);

	public void deletePost(int id);

	public void saveUser(BGUser newUser);
}
