package kajetansw.bloglobe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kajetansw.bloglobe.entity.Post;
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
		
		return "dashboard";
	}
}
