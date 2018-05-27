package kajetansw.bloglobe.controller;

import java.util.List;

import javax.validation.Valid;

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
import org.springframework.validation.BindingResult;
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
	public String processRegistrationForm(@Valid @ModelAttribute("newUser") BGUser newUser,
			Model theModel, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			return "registration";
		}
		
		if (doesUserExist(newUser.getUsername())) {
			
			theModel.addAttribute("newUser", new BGUser());
			theModel.addAttribute("registrationError", "Username is already in use!");
			
			return "registration";
		}
		
		saveNewUserInDatabase(newUser);
		
		return "registration-confirmation";
	}
	
	
	
	
	
	////////////////////////////////
	// HELPER METHODS
	////////////////////////////////
	
	private boolean doesUserExist(String username) {
		return userDetailsManager.userExists(username);
	}
	
	private String createEncodedPasswordForDatabase(BGUser user) {
		return "{bcrypt}" + passwordEncoder.encode(user.getPassword());
	}
	
	private void saveNewUserInDatabase(BGUser newUser) {
		
		String encodedPassword = createEncodedPasswordForDatabase(newUser);
		List<GrantedAuthority> usersAuthorities = AuthorityUtils.createAuthorityList("ROLE_USER");
		
		User tempSpringSecurityUser = new User(newUser.getUsername(), encodedPassword, usersAuthorities);
		
		userDetailsManager.createUser(tempSpringSecurityUser);
		bloglobeService.updateUsersFirstNameLastNameAndEmail(newUser);
	}
}
