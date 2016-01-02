package application.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.persistance.dao.OfertyDao;
import application.persistance.dao.RodzajePojazdowDao;
import application.persistance.dao.RyzykaDao;
import application.persistance.dao.TowarzystwoDao;
import application.persistance.dao.UserDao;
import application.persistance.model.Oferta;
import application.persistance.model.OfertaSzczegoly;
import application.persistance.model.RodzajPojazdu;
import application.persistance.model.Ryzyko;
import application.persistance.model.Towarzystwo;
import application.persistance.model.User;

@Controller
public class ClientsController {

	@Autowired
	UserDao usersRepository;

	@Autowired
	RodzajePojazdowDao rodzajePojazdowRepository;

	@Autowired
	RyzykaDao ryzykaRepository;

	@Autowired
	TowarzystwoDao towarzystwaRepository;

	@Autowired
	OfertyDao ofertyRepository;

	@RequestMapping(value = "/baza-klientow", method = RequestMethod.GET)
	public String printClientListPage(
			@RequestParam(value = "result", required = false) String result,
			ModelMap model) {

		User loggedUser = usersRepository.findByEmail(SecurityContextHolder
				.getContext().getAuthentication().getName());

		if (loggedUser.getTyp().equals("admin")) {
			model.addAttribute("klienci", usersRepository.getAllClients());
		} else if (loggedUser.getTyp().equals("agent")) {
			model.addAttribute("klienci",
					usersRepository.getClientsOfAgent(loggedUser.getEmail()));
		} else if (loggedUser.getTyp().equals("towarzystwo")) {
			model.addAttribute("klienci", usersRepository
					.getClientsOfTowarzystwo(loggedUser.getEmail()));
		}

		model.addAttribute("result", result);

		return "lista-klientow";
	}

	@RequestMapping(value = "/baza-klientow/klient", method = RequestMethod.GET)
	public String printClientPage(
			@RequestParam(value = "kli", required = true) String klientEmail,
			ModelMap model) {

		User loggedUser = usersRepository.findByEmail(SecurityContextHolder
				.getContext().getAuthentication().getName());

		User client = usersRepository.findByEmail(klientEmail);

		if (!loggedUser.getTyp().equals("admin")) {
			if (loggedUser.getTyp().equals("agent")
					&& !client.getAgent().equals(loggedUser.getEmail())) {
				return "403";
			}
			if (loggedUser.getTyp().equals("towarzystwo")
					&& !client.getPracownicy().containsValue(
							loggedUser.getEmail())) {
				return "403";
			}
		}

		model.addAttribute("klient", client);

		List<RodzajPojazdu> pojazdy = rodzajePojazdowRepository
				.getAllRodzajePojazdow();

		model.addAttribute("pojazdy", pojazdy);

		List<Oferta> oferty = ofertyRepository.getAllOfClient(klientEmail);

		System.out.println(oferty.size());

		model.addAttribute("oferty", oferty);

		return "karta-klienta";
	}

	@RequestMapping(value = "/baza-klientow/klient/opis", method = RequestMethod.POST)
	public String changeClientDescription(
			@RequestParam(value = "kli", required = true) String klientEmail,
			@RequestParam(value = "opis", required = true) String opis,
			ModelMap model) {

		User client = usersRepository.findByEmail(klientEmail);
		client.setKlientUwagi(opis);
		usersRepository.updateUser(client);

		return printClientPage(klientEmail, model);
	}

	@RequestMapping(value = "/baza-klientow/klient/pojazdy", method = RequestMethod.GET)
	public String printClientPojazdyPage(
			@RequestParam(value = "kli", required = true) String klientEmail,
			ModelMap model) {

		User client = usersRepository.findByEmail(klientEmail);

		model.addAttribute("klient", client);

		List<RodzajPojazdu> pojazdy = rodzajePojazdowRepository
				.getAllRodzajePojazdow();

		model.addAttribute("pojazdy", pojazdy);

		PojazdyMapForm pojazdyMap = new PojazdyMapForm();

		model.addAttribute("pojazdyMapForm", pojazdyMap);

		return "baza-pojazdow";
	}

	@RequestMapping(value = "/baza-klientow/klient/pojazdy/proceed", method = RequestMethod.POST)
	public String proceedPojazdyChange(
			@RequestParam(value = "kli", required = true) String klientEmail,
			@ModelAttribute(value = "pojazdyMapForm") PojazdyMapForm pojazdyMapForm,
			ModelMap model) {

		User client = usersRepository.findByEmail(klientEmail);
		client.setPojazdy(pojazdyMapForm.getMap());
		usersRepository.updateUser(client);

		return printClientPage(klientEmail, model);
	}

	@RequestMapping(value = "/baza-klientow/klient/oferta", method = RequestMethod.GET)
	public String printAddOfferPage(
			@RequestParam(value = "kli", required = true) String klientEmail,
			ModelMap model) {

		User client = usersRepository.findByEmail(klientEmail);

		model.addAttribute("klient", client);

		List<Towarzystwo> towarzystwa = towarzystwaRepository.getAll();

		model.addAttribute("towarzystwa", towarzystwa);

		List<RodzajPojazdu> pojazdy = rodzajePojazdowRepository
				.getAllRodzajePojazdow();

		model.addAttribute("pojazdy", pojazdy);

		List<Ryzyko> ryzyka = ryzykaRepository.getAllRyzyka();

		model.addAttribute("ryzyka", ryzyka);

		OfertyForm ofertyForm = new OfertyForm();

		for (int i = 0; i < (ryzyka.size() * pojazdy.size()); i++) {
			ofertyForm.getList().add(new OfertaSzczegoly());
		}

		model.addAttribute("ofertyForm", ofertyForm);

		return "dodaj-oferte";
	}

	@RequestMapping(value = "/baza-klientow/klient/oferta/proceed", method = RequestMethod.POST)
	public String proceedAddOffer(

	@ModelAttribute(value = "ofertyForm") OfertyForm ofertyForm, ModelMap model) {

		Oferta oferta = new Oferta();
		oferta.setKlientEmail(ofertyForm.getKlientEmail());
		oferta.setTowarzystwo(ofertyForm.getTowarzystwo());
		oferta.setRok(ofertyForm.getRok());
		oferta.setMiesiac(ofertyForm.getMiesiac());
		oferta.setDzien(ofertyForm.getDzien());
		oferta.setPdfData(ofertyForm.getData());
		oferta.setPdfName(ofertyForm.getTowarzystwo() + " "
				+ ofertyForm.getDzien() + "-" + ofertyForm.getMiesiac() + "-"
				+ ofertyForm.getRok() + ".pdf");

		for (OfertaSzczegoly p : ofertyForm.getList()) {
			p.setOferta(oferta);
		}

		oferta.setSzczegoly(ofertyForm.getList());

		ofertyRepository.addOferta(oferta);

		model.addAttribute("result", "success");

		return printClientPage(ofertyForm.getKlientEmail(), model);
	}
	
	@RequestMapping(value="/oferta/{ofertaId}", method = RequestMethod.POST)
	public String printOfferPage(ModelMap model, @PathVariable(value="ofertaId") Integer ofertaId) {
		
		Oferta oferta = ofertyRepository.getById(ofertaId);
		
		User klient = usersRepository.findByEmail(oferta.getKlientEmail());
		
		model.addAttribute("klient", klient);
		model.addAttribute("oferta", oferta);
		
		
		return "oferta"; 
	}

}

class PojazdyMapForm {
	private Map<Integer, Integer> map;

	public PojazdyMapForm() {
		map = new HashMap<>();
	}

	public Map<Integer, Integer> getMap() {
		return map;
	}

	public void setMap(Map<Integer, Integer> map) {
		this.map = map;
	}

}

class OfertyForm {
	List<OfertaSzczegoly> list = new ArrayList<>();

	byte[] data;

	String klientEmail;

	String rok;

	String miesiac;

	String dzien;

	String towarzystwo;

	public String getTowarzystwo() {
		return towarzystwo;
	}

	public void setTowarzystwo(String towarzystwo) {
		this.towarzystwo = towarzystwo;
	}

	public String getKlientEmail() {
		return klientEmail;
	}

	public void setKlientEmail(String klientEmail) {
		this.klientEmail = klientEmail;
	}

	public String getRok() {
		return rok;
	}

	public void setRok(String rok) {
		this.rok = rok;
	}

	public String getMiesiac() {
		return miesiac;
	}

	public void setMiesiac(String miesiac) {
		this.miesiac = miesiac;
	}

	public String getDzien() {
		return dzien;
	}

	public void setDzien(String dzien) {
		this.dzien = dzien;
	}

	public List<OfertaSzczegoly> getList() {
		return list;
	}

	public void setList(List<OfertaSzczegoly> list) {
		this.list = list;
	}

	public OfertyForm() {
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

}