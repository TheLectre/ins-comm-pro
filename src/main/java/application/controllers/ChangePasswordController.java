package application.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.persistance.users.dao.UserDao;
import application.persistance.users.model.User;

@Controller
public class ChangePasswordController {

	@Autowired
	UserDao repo;

	@RequestMapping(value = "/change-password", method = RequestMethod.GET)
	public String printChangePasswordPage(
			@RequestParam(value = "result", required = false) String result,
			ModelMap model) {

		model.addAttribute("result", result);

		return "change-password";
	}

	@RequestMapping(value = "/change-password/proceed", method = RequestMethod.POST)
	public String proceedChangingPassword(
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "currentPassword", required = true) String currentPassword,
			@RequestParam(value = "newPassword", required = true) String newPassword,
			@RequestParam(value = "repeatPassword", required = true) String repeatPassword,
			ModelMap model) {

		User user = repo.findByEmail(email);

		if (user == null) {
			model.addAttribute("result", "systemError");

			return "change-password";
		}

		if (!newPassword.equals(repeatPassword)) {

			model.addAttribute("result", "newNewMatching");

			return "change-password";
		}

		if (!user.getPassword().equals(currentPassword)) {

			model.addAttribute("result", "oldNewMatching");

			return "change-password";
		}

		if (newPassword.isEmpty()) {

			model.addAttribute("result", "empty");

			return "change-password";
		}

		if (user.getPassword().equals(currentPassword)) {

			user.setPassword(newPassword);
			repo.updateUser(user);

			model.addAttribute("result", "success");

			return "change-password";
		}

		model.addAttribute("result", "unknown");

		return "change-password";
	}

}
