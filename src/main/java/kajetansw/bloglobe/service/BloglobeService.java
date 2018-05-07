package kajetansw.bloglobe.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kajetansw.bloglobe.dao.BloglobeDAO;
import kajetansw.bloglobe.dao.IBloglobeDAO;
import kajetansw.bloglobe.entity.Post;

@Service
public class BloglobeService implements IBloglobeService {

	@Autowired
	private IBloglobeDAO bloglobeDAO;
	
	@Override
	@Transactional
	public List<Post> getPosts() {
		return bloglobeDAO.getPosts();
	}


}