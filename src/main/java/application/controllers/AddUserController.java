package application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/adduser")
public class AddUserController {

	@RequestMapping(value = "/validate", method = RequestMethod.GET)
	public String printConfirmPage(
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "imie", required = false) String imie,
			@RequestParam(value = "nazwisko", required = false) String nazwisko) {

		return "vd";
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String printAddUserPage(
			@RequestParam(value = "type", required = false) String type,
			ModelMap model) {

		model.addAttribute("type", type);

		return "add-user";
	}


}