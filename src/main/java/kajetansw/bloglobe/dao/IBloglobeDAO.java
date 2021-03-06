package kajetansw.bloglobe.dao;

import java.util.List;

import kajetansw.bloglobe.entity.BGUser;
import kajetansw.bloglobe.entity.Post;

public interface IBloglobeDAO {

	public List<Post> getAllPosts();

	public void saveOrUpdatePost(Post thePost);

	public BGUser getCurrentUserByName(String currentPrincipalName);

	public Post getPostById(int id);

	public void deletePost(int id);

	public void updateUsersFirstNameLastNameAndEmail(BGUser theUser);

	public List<BGUser> getAllUsers();

}
