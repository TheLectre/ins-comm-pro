package application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping(value={"/", "/home"}, method=RequestMethod.GET)
	public String printHomePage() {
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String printLoginPage(
			@RequestParam(value = "error", required = false) boolean error,
			@RequestParam(value = "logout", required = false) boolean logout,
			ModelMap model) {

		model.addAttribute("error", error);
		model.addAttribute("logout", logout);

		return "login";
	}
	
	@RequestMapping(value={"/403"})
	public String print403Page(ModelMap model) {
		return "403";
	}

}