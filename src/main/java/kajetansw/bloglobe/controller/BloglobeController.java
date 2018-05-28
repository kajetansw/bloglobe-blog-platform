package kajetansw.bloglobe.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kajetansw.bloglobe.entity.BGUser;
import kajetansw.bloglobe.entity.Post;
import kajetansw.bloglobe.service.IBloglobeService;

@Controller
@RequestMapping("/bg")
public class BloglobeController {
	
	@Autowired
	private IBloglobeService bloglobeService;
	
	@GetMapping("")
	public String showDashboard(Model theModel) {
		
		BGUser currentUser = getCurrentUser();
		List<Post> currentUsersPosts = currentUser.getPosts();
		
		Post newPost = new Post();
		newPost.setUser(currentUser);
		
		theModel.addAttribute("currentUsersPosts", currentUsersPosts);
		theModel.addAttribute("post", newPost);
		theModel.addAttribute("currentUser", currentUser);
		
		return "dashboard";
	}
	
	@GetMapping("/posts")
	public String showAllPosts(Model theModel) {
		
		List<Post> allPosts = bloglobeService.getAllPosts();
		
		theModel.addAttribute("posts", allPosts);
		theModel.addAttribute("currentUser", getCurrentUser());
		
		return "posts";
	}
	
	@PostMapping("/save-post")
	public String saveOrUpdatePost(@Valid @ModelAttribute("post") Post thePost, 
			BindingResult bindingResult, Model theModel) {
		
		if (bindingResult.hasErrors()) {
			theModel.addAttribute("currentUser", getCurrentUser());
			return "add-post-form";
		}
		
		thePost.setDate(LocalDateTime.now(ZoneId.of("GMT+2")));
		
		bloglobeService.saveOrUpdatePost(thePost);
			
		return "redirect:/";
	}
	
	@GetMapping("/view-post")
	public String viewPost(@RequestParam(value="id") final int id, 
			Model theModel) {
		
		Post postToView = bloglobeService.getPostById(id);
		
		theModel.addAttribute("currentUser", getCurrentUser());
		theModel.addAttribute("postToView", postToView);
		
		return "view-post";
	}
	
	@GetMapping("edit-post")
	public String editPost(@RequestParam(value="id") final int id, Model theModel) {
		
		Post postToEdit = bloglobeService.getPostById(id);
		BGUser currentUser = getCurrentUser();
		
		// check if the author of the post is the current user
		if (isUserAuthorOfPost(currentUser, postToEdit)) {
			
			theModel.addAttribute("postToEdit", postToEdit);
			theModel.addAttribute("currentUser", currentUser);
			return "edit-post";
		} 
		else {
			return "access-denied";
		}
		
	}
	
	@GetMapping("delete-post")
	public String deletePost(@RequestParam(value="id") final int id, Model theModel) {
		
		Post postToDelete = bloglobeService.getPostById(id);
		BGUser currentUser = getCurrentUser();
		
		// check if the author of the post is the current user
		if (isUserAuthorizedForPostDelete(currentUser, postToDelete)) {
			
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
	
	private BGUser getCurrentUser() {
		
		// retrieve the current authenticated principal user
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		
		// get User from the Service
		BGUser currentUser = bloglobeService.getCurrentUserByName(currentPrincipalName);
		
		return currentUser;
	}
	
	private boolean isUserAuthorOfPost(BGUser user, Post post) {
		return post.getUser().getUsername().equals(user.getUsername());
	}
	
	private boolean isUserAuthorizedForPostDelete(BGUser user, Post post) {
		return isUserAuthorOfPost(user, post) || user.getUsername().equals("admin");
	}
	
}
