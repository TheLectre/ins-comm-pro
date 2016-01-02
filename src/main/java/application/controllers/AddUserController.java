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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import application.persistance.dao.TowarzystwoDao;
import application.persistance.dao.UserDao;
import application.persistance.model.Towarzystwo;
import application.persistance.model.User;
import application.persistance.util.RolesProvider;

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

		model.addAttribute("type", type);
		model.addAttribute("result", result);

		if (type != null && type.equals("klient")) {

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
			
		} else if (type != null && type.equals("towarzystwo")) {

			model.addAttribute("towarzystwa", towarzystwaRepository.getAll());
		}
		
		model.addAttribute("user", user);

		return "add-user";
	}

	@RequestMapping(value = "/adduser/validate", method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("user") User user,
			BindingResult result,
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
	
	//loga towarzystw
	@RequestMapping(value = "/images/towarzystwa/{nazwa}")
	@ResponseBody
	public byte[] showImage(@PathVariable String nazwa)  {
		return towarzystwaRepository.getTowarzystwo(nazwa).getLogoData();
	}

}