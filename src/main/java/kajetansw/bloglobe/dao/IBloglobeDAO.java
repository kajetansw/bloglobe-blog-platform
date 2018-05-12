package kajetansw.bloglobe.dao;

import java.util.List;

import kajetansw.bloglobe.entity.Post;

public interface IBloglobeDAO {

	public List<Post> getPosts();

	public void savePost(Post thePost);

}
