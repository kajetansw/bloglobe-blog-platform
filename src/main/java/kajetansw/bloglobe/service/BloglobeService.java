package kajetansw.bloglobe.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kajetansw.bloglobe.dao.IBloglobeDAO;
import kajetansw.bloglobe.entity.BGUser;
import kajetansw.bloglobe.entity.Post;

@Service
public class BloglobeService implements IBloglobeService {

	@Autowired
	private IBloglobeDAO bloglobeDAO;
	
	@Override
	@Transactional
	public List<Post> getAllPosts() {
		return bloglobeDAO.getAllPosts();
	}

	@Override
	@Transactional
	public void saveOrUpdatePost(Post thePost) {
		bloglobeDAO.saveOrUpdatePost(thePost);
	}

	@Override
	@Transactional
	public BGUser getCurrentUserByName(String currentPrincipalName) {
		return bloglobeDAO.getCurrentUserByName(currentPrincipalName);
	}

	@Override
	@Transactional
	public Post getPostById(int id) {
		return bloglobeDAO.getPostById(id);
	}

	@Override
	@Transactional
	public void deletePost(int id) {
		bloglobeDAO.deletePost(id);
	}

	@Override
	@Transactional
	public void updateUsersFirstNameLastNameAndEmail(BGUser theUser) {
		bloglobeDAO.updateUsersFirstNameLastNameAndEmail(theUser);
	}


}
