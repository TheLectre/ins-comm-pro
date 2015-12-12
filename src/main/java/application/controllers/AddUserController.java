package application.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.persistance.towarzystwa.dao.TowarzystwoDao;
import application.persistance.users.dao.UserDao;
import application.persistance.users.model.User;
import application.persistance.users.util.RolesProvider;

@Controller
public class AddUserController {

	@Autowired
	UserDao usersRepository;
	
	@Autowired
	TowarzystwoDao towarzystwaRepository;

	@RequestMapping(value = "/adduser", method = RequestMethod.GET)
	public String printAddUserPage(
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "result", required = false) String result,
			ModelMap model) {

		User user = new User();
		
		model.addAttribute("user", user);
		model.addAttribute("type", type);
		model.addAttribute("result", result);

		model.addAttribute("towarzystwa", towarzystwaRepository.getAll());
		
		return "add-user";
	}

	@RequestMapping(value = "/adduser/validate", method = RequestMethod.POST)
	public String processRegistration(
			@ModelAttribute("user") User user, BindingResult result,
			@RequestParam(value = "type", required = true) String type,
			ModelMap model) {

		if (result.hasErrors()) {
			return "error";
		}
		
		user.setTyp(type);
		user.setRole(RolesProvider.provideRoles(user));
		
		if (!usersRepository.addUser(user)) {
													
			model.addAttribute("result", "error");

			return "add-user";
		}

		model.addAttribute("result", "success");
		return "add-user";
	}

}