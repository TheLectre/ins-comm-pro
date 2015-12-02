package application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.persistance.users.model.User;

@Controller
public class AddUserController {

	@RequestMapping(value = "/adduser", method = RequestMethod.GET)
	public String printAddUserPage(
			@RequestParam(value = "type", required = false) String type,
			ModelMap model) {

		User.UserDto userDto = new User.UserDto();

		model.addAttribute("user", userDto);
		model.addAttribute("type", type);

		return "add-user";
	}

	@RequestMapping(value = "/adduser/validate", method = RequestMethod.POST)
	public String printConfirmPage(@ModelAttribute("user") User.UserDto user,
			BindingResult result, ModelMap model) {
		
		if(result.hasErrors()) {
			return "error";
		}
		
		model.addAttribute("user", user);
		
		
		return "validate";
	}

}