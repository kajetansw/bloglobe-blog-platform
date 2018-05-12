package kajetansw.bloglobe.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kajetansw.bloglobe.entity.Post;
import kajetansw.bloglobe.entity.User;

@Repository
public class BloglobeDAO implements IBloglobeDAO {
	
	// inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Post> getPosts() {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create query to get all Users
		Query<Post> theQuery = currentSession.createQuery("from Post order by date desc", Post.class);
		
		// execute query and get result list
		List<Post> posts = theQuery.getResultList();
		
		return posts;
	}

	@Override
	public void savePost(Post thePost) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/update the post
		currentSession.saveOrUpdate(thePost);
	}

	@Override
	public User getCurrentUser(String currentPrincipalName) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// get User by primary key
		User theUser = currentSession.get(User.class, currentPrincipalName);
		
		return theUser;
	}

	@Override
	public Post getPostById(int id) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// get Post by id
		Post thePost = currentSession.get(Post.class, id);
		
		return thePost;
	}

}
