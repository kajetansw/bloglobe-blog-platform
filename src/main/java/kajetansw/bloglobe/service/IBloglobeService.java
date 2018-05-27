package kajetansw.bloglobe.service;

import java.util.List;

import kajetansw.bloglobe.entity.BGUser;
import kajetansw.bloglobe.entity.Post;

public interface IBloglobeService {
	
	public List<Post> getAllPosts();

	public void saveOrUpdatePost(Post thePost);

	public BGUser getCurrentUserByName(String currentPrincipalName);

	public Post getPostById(int id);

	public void deletePost(int id);

	public void updateUsersFirstNameAndLastName(BGUser newUser);
}
