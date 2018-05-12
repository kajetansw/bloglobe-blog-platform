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
		
		// retrieve the current authenticated principal user
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		
		// get User from the Service
		User currentUser = bloglobeService.getCurrentUser(currentPrincipalName);
		
		// create model attribute to bind Add Form data and set current User
		Post newPost = new Post();
		newPost.setUser(currentUser);
		newPost.setDate(LocalDateTime.now());
		
		// add newPost to the model
		theModel.addAttribute("post", newPost);
		
		return "dashboard";
	}
	
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
		
		// add postToView to the Model
		theModel.addAttribute("postToView", postToView);
		
		return "view-post";
	}
}
