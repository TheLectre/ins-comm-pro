package application.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.persistance.towarzystwa.dao.TowarzystwoDao;
import application.persistance.towarzystwa.model.Towarzystwo;
import application.persistance.users.dao.UserDao;
import application.persistance.users.model.User;

@Controller
public class UserListController {

	@Autowired
	UserDao usersRepository;
	
	@Autowired
	TowarzystwoDao towarzystwaRepository;

	@RequestMapping(value = "/user-list", method = RequestMethod.GET)
	public String printUserListPage(ModelMap model) {

		List<User> admins = usersRepository.getAllUsersOfType("admin");
		List<User> agents = usersRepository.getAllUsersOfType("agent");
		List<User> clients = usersRepository.getAllUsersOfType("klient");
		List<User> tus = usersRepository.getAllUsersOfType("towarzystwo");

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
		
		User user = usersRepository.findByEmail(email);

		if (user.getTyp().equals("klient")) {

			//agenci
			model.addAttribute("agenci",
					usersRepository.getAllUsersOfType("agent"));
			
			//towarzystwa i pracownicy
			List mainList = new ArrayList();
			List<Towarzystwo> towarzystwa = towarzystwaRepository.getAll();
			
			for(Towarzystwo p : towarzystwa) {
				
				Map tuStructure = new HashMap();
				
				List<User> pracownicy = usersRepository.getPracownicyTu(p.getNazwa());
				List<String> emaile = new ArrayList<>();
				
				for(User k : pracownicy) {
					emaile.add(k.getEmail());
				}
				
				tuStructure.put("nazwa", p.getNazwa());
				tuStructure.put("pracownicy", emaile);
				
				user.getPracownicy().put(p.getNazwa(), "");
				
				mainList.add(tuStructure);
			}
			
			
			model.addAttribute("tus", mainList);
			
		}
		
		model.addAttribute("user", user);
		return "edit-user";
	}
	
	@RequestMapping(value = "/user-list/edit-user/proceed", method = RequestMethod.POST)
	public String processEdition(@ModelAttribute("user") User user, BindingResult result, ModelMap model) {
		
		if (result.hasErrors()) {
			return "error";
		}
		
		usersRepository.updateUser(user);
		
		model.addAttribute("result", "success");
		
		return printUserListPage(model);
	}

}
