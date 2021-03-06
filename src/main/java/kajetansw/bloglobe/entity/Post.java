package kajetansw.bloglobe.entity;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="posts")
public class Post {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="title")
	@NotNull(message = "is required")
	@Size(min = 1, message = "Title is required!")
	private String title;
	
	@Column(name="content")
	@NotNull(message = "is required")
	@Size(min = 1, message = "Post must have a body!")
	private String content;
	
	@Column(name="date")
	private java.time.LocalDateTime date;
	
	@ManyToOne(cascade = {
		CascadeType.DETACH,	
		CascadeType.MERGE,	
		CascadeType.PERSIST,	
		CascadeType.REFRESH	
	})
	@JoinColumn(name="username")
	private BGUser user;

	public Post() {
	}

	public Post(int id, String title, String content, LocalDateTime date) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
	}

	public Post(int id, String title, String content, LocalDateTime date, BGUser user) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.time.LocalDateTime getDate() {
		return date;
	}

	public void setDate(java.time.LocalDateTime date) {
		this.date = date;
	}

	public BGUser getUser() {
		return user;
	}

	public void setUser(BGUser user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", content=" + content + ", date=" + date + "]";
	}
	
	
	
}
