package kajetansw.bloglobe.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class BGUser {

	@Id
	@Column(name="username")
	@NotNull(message = "is required")
	private String username;
	
	@Column(name="password")
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String password;
	
	@Column(name="first_name")
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String firstName;
	
	@Column(name="last_name")
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String lastName;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="user", cascade= CascadeType.ALL)
	private List<Post> posts;

	public BGUser() {
	}

	public BGUser(String username, String password, String firstName, String lastName) {
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	@Override
	public String toString() {
		return "BGUser [username=" + username + ", password=" + password 
				+ ", firstName=" + firstName + ", lastName="
				+ lastName + "]";
	}
	
	
}
