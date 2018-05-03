package kajetansw.bloglobe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BloglobeController {

	@GetMapping("/")
	public String showDashboard() {
		
		return "dashboard";
	}
}
