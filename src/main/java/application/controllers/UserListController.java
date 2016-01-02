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

import application.persistance.dao.TowarzystwoDao;
import application.persistance.dao.UserDao;
import application.persistance.model.Towarzystwo;
import application.persistance.model.User;

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
		model.addAttribute("user", user);

		if (user.getTyp().equals("klient")) {

			// agenci
			model.addAttribute("agenci",
					usersRepository.getAllUsersOfType("agent"));

			// towarzystwa i pracownicy
			List mainList = new ArrayList();
			List<Towarzystwo> towarzystwa = towarzystwaRepository.getAll();

			for (Towarzystwo p : towarzystwa) {

				Map tuStructure = new HashMap();

				List<User> pracownicy = usersRepository.getPracownicyTu(p
						.getNazwa());
				List<String> emaile = new ArrayList<>();

				for (User k : pracownicy) {
					emaile.add(k.getEmail());
				}

				tuStructure.put("nazwa", p.getNazwa());
				tuStructure.put("pracownicy", emaile);

				user.getPracownicy().put(p.getNazwa(), "");

				mainList.add(tuStructure);
			}

			model.addAttribute("tus", mainList);

		}

		return "edit-user";
	}

	@RequestMapping(value = "/user-list/edit-user/proceed", method = RequestMethod.POST)
	public String processEdition(@ModelAttribute("user") User user,
			BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "error";
		}

		User updatedUser = usersRepository.findByEmail(user.getEmail());

		updatedUser.setEmail(user.getEmail());

		if (!user.getPassword().isEmpty()) {
			updatedUser.setPassword(user.getPassword());
		}
		if (!user.getTyp().isEmpty()) {
			updatedUser.setTyp(user.getTyp());
		}
		if (!user.getImie().isEmpty()) {
			updatedUser.setImie(user.getImie());
		}
		if (!user.getNazwisko().isEmpty()) {
			updatedUser.setNazwisko(user.getNazwisko());
		}
		if (!user.getTelefon().isEmpty()) {
			updatedUser.setTelefon(user.getTelefon());
		}
		if (!user.getUlica().isEmpty()) {
			updatedUser.setUlica(user.getUlica());
		}
		if (!user.getKod().isEmpty()) {
			updatedUser.setKod(user.getKod());
		}
		if (!user.getMiasto().isEmpty()) {
			updatedUser.setMiasto(user.getMiasto());
		}
		if (!user.getRegion().isEmpty()) {
			updatedUser.setRegion(user.getRegion());
		}
		if (!user.getNip().isEmpty()) {
			updatedUser.setNip(user.getNip());
		}
		if (!user.getFirma().isEmpty()) {
			updatedUser.setFirma(user.getFirma());
		}
		if (!user.getAgent().isEmpty()) {
			updatedUser.setAgent(user.getAgent());
		}

		updatedUser.setPracownicy(user.getPracownicy());

		if (!user.getTowarzystwo().isEmpty()) {
			updatedUser.setTowarzystwo(user.getTowarzystwo());
		}
		if (!user.getKlientUwagi().isEmpty()) {
			updatedUser.setKlientUwagi(user.getKlientUwagi());
		}

		updatedUser.setKlientFloty(user.getKlientFloty());
		updatedUser.setKlientGwarancje(user.getKlientGwarancje());
		updatedUser.setKlientMajatekIOc(user.getKlientMajatekIOc());
		updatedUser.setKlientGrupowe(user.getKlientGrupowe());
		
		usersRepository.updateUser(updatedUser);

		model.addAttribute("result", "success");

		if (user.getTyp().equals("klient")) {
			return "redirect:/baza-klientow";
		}

		return printUserListPage(model);
	}

}
