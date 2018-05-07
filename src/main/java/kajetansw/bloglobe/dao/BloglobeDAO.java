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

}
