package application.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.persistance.users.dao.UserDao;
import application.persistance.users.model.User;

@Controller
public class UserListController {

	@Autowired
	UserDao repo;

	@RequestMapping(value = "/user-list", method = RequestMethod.GET)
	public String printUserListPage(ModelMap model) {

		List<User> admins = repo.getAllUsersOfType("admin");
		List<User> agents = repo.getAllUsersOfType("agent");
		List<User> clients = repo.getAllUsersOfType("klient");
		List<User> tus = repo.getAllUsersOfType("towarzystwo");

		model.addAttribute("admins", admins);
		model.addAttribute("agents", agents);
		model.addAttribute("clients", clients);
		model.addAttribute("tus", tus);

		return "user-list";
	}

	@RequestMapping(value = "/user-list/edit-user", method = RequestMethod.POST)
	public String printUserEditPage(
			@RequestParam(value = "email", required = true) String email,
			ModelMap model) {
		
		User user = repo.findByEmail(email);
		
		if(user.getTyp().equals("klient")) {
			model.addAttribute("agenci", repo.getAllUsersOfType("agent"));
		}
		
		model.addAttribute("user", user);

		return "edit-user";
	}
	
	@RequestMapping(value = "/user-list/edit-user/proceed", method = RequestMethod.POST)
	public String processEdition(@ModelAttribute("user") User user, BindingResult result, ModelMap model) {
		
		if (result.hasErrors()) {
			return "error";
		}
		
		repo.updateUser(user);
		
		model.addAttribute("result", "success");
		
		return printUserListPage(model);
	}

}
