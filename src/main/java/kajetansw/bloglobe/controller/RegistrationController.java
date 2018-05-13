package kajetansw.bloglobe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kajetansw.bloglobe.entity.BGUser;
import kajetansw.bloglobe.service.IBloglobeService;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Autowired
	private UserDetailsManager userDetailsManager;
	
	@Autowired
	private IBloglobeService bloglobeService;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		// trim all form inputs before it is put to the database
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	@GetMapping("/")
	public String registrationForm(Model theModel) {
		
		theModel.addAttribute("newUser", new BGUser());
		
		return "registration";
	}
	
	@PostMapping("/process")
	public String processRegistrationForm(@ModelAttribute("newUser") BGUser newUser,
			Model theModel) {
		
		// check the database if user already exists
		if (doesUserExist(newUser.getUsername())) {
			theModel.addAttribute("newUser", new BGUser());
			theModel.addAttribute("registrationError", "User name/password is already in use.");
			
			return "registration";
		}
		
		// encrypt the password
		String encodedPassword = passwordEncoder.encode(newUser.getPassword());
		
		// complete encoding algorithm for database
		encodedPassword = "{bcrypt}" + encodedPassword;
		
		// give user default role of USER
		List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_USER");
		
		// create User object
		User tempUser = new User(newUser.getUsername(), encodedPassword, authorities);
		
		// save user in the db
		userDetailsManager.createUser(tempUser);
		
		// update user's firstName and lastName
		bloglobeService.saveUser(newUser);
		
		return "registration-confirmation";
	}
	
	
	
	
	
	////////////////////////////////
	// HELPER METHODS
	////////////////////////////////
	
	private boolean doesUserExist(String username) {
		
		boolean exists = userDetailsManager.userExists(username);
		
		return exists;
	}
}
