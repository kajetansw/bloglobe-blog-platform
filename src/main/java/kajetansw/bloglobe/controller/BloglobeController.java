package kajetansw.bloglobe.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kajetansw.bloglobe.entity.Post;
import kajetansw.bloglobe.entity.User;
import kajetansw.bloglobe.service.IBloglobeService;

@Controller
public class BloglobeController {
	
	@Autowired
	private IBloglobeService bloglobeService;

	@GetMapping("/")
	public String showDashboard(Model theModel) {
		
		// get Posts from the Service
		List<Post> thePosts = bloglobeService.getPosts();
		
		// add posts to the model
		theModel.addAttribute("posts", thePosts);
		
		// get User from the Service
		User currentUser = getCurrentUser();
		
		// create model attribute to bind Add Form data and set current User
		Post newPost = new Post();
		newPost.setUser(currentUser);
		newPost.setDate(LocalDateTime.now());
		
		// add newPost nad current User to the model
		theModel.addAttribute("post", newPost);
		theModel.addAttribute("currentUser", getCurrentUser());
		
		return "dashboard";
	}
	
	// saving or updating Post
	@PostMapping("/save-post")
	public String savePost(@ModelAttribute("post") Post thePost) {
		
		// save the customer using Service
		bloglobeService.savePost(thePost);
		
		return "redirect:/";
	}
	
	@GetMapping("/view-post")
	public String viewPost(@RequestParam(value="id") final int id, 
			Model theModel) {
		
		// get Post from the Service by its id
		Post postToView = bloglobeService.getPostById(id);
		
		// add currentUser to the Model
		theModel.addAttribute("currentUser", getCurrentUser());
		
		// add postToView to the Model
		theModel.addAttribute("postToView", postToView);
		
		return "view-post";
	}
	
	@GetMapping("edit-post")
	public String editPost(@RequestParam(value="id") final int id, 
			Model theModel) {
		
		// get Post from the Service by its id
		Post postToEdit = bloglobeService.getPostById(id);
		
		// get current User
		User currentUser = getCurrentUser();
		
		// check if the author of the post is the current user
		if (postToEdit.getUser().getUsername().equals(currentUser.getUsername())) {
			
			// add postToEdit to the Model
			theModel.addAttribute("postToEdit", postToEdit);
			
			return "edit-post";
		} 
		else {
			return "access-denied";
		}
		
	}
	
	@GetMapping("delete-post")
	public String deletePost(@RequestParam(value="id") final int id,
			Model theModel) {
		
		// get Post from the Service by its id
		Post postToDelete = bloglobeService.getPostById(id);
		
		// get current User
		User currentUser = getCurrentUser();
		
		// check if the author of the post is the current user
		if (postToDelete.getUser().getUsername().equals(currentUser.getUsername()) || currentUser.getUsername().equals("admin")) {
			
			// delete the post
			bloglobeService.deletePost(id);
			
			return "redirect:/";
		} 
		else {
			return "access-denied";
		}
	}
	
	
	///////////////////////////////
	// HELPER METHODS
	///////////////////////////////
	
	private User getCurrentUser() {
		
		// retrieve the current authenticated principal user
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		
		// get User from the Service
		User currentUser = bloglobeService.getCurrentUser(currentPrincipalName);
		
		return currentUser;
	}
}
