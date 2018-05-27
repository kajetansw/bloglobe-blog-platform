package kajetansw.bloglobe.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kajetansw.bloglobe.entity.BGUser;
import kajetansw.bloglobe.entity.Post;

@Repository
public class BloglobeDAO implements IBloglobeDAO {
	
	// inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Post> getAllPosts() {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create query to get all Users
		Query<Post> getAllUsersQuery = currentSession.createQuery("from Post order by date desc", Post.class);
		
		// execute query and get result list
		List<Post> allPosts = getAllUsersQuery.getResultList();
		
		return allPosts;
	}

	@Override
	public void saveOrUpdatePost(Post thePost) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/update the post
		currentSession.saveOrUpdate(thePost);
	}

	@Override
	public BGUser getCurrentUserByName(String currentPrincipalName) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// get User by primary key
		BGUser theUser = currentSession.get(BGUser.class, currentPrincipalName);
		
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

	@Override
	public void deletePost(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query deleteQuery = currentSession.createQuery(
			"delete from Post where id=:postId"
		);
		deleteQuery.setParameter("postId", id);
		
		deleteQuery.executeUpdate();
	}

	@Override
	public void updateUsersFirstNameLastNameAndEmail(BGUser theUser) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete post with given id
		Query saveQuery = currentSession.createQuery(
			"update BGUser set firstName = :firstName, lastName = :lastName, email = :email where username = :username"
		);
		saveQuery.setParameter("firstName", theUser.getFirstName());
		saveQuery.setParameter("lastName", theUser.getLastName());
		saveQuery.setParameter("username", theUser.getUsername());
		saveQuery.setParameter("email", theUser.getEmail());
		
		saveQuery.executeUpdate();
	}

}
