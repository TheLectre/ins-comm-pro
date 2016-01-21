package application.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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

		model.addAttribute("oferty", oferty);

		// charts

		// ryzyka
		Set<String> ryzykaStr = new LinkedHashSet<>();
		Set<Ryzyko> ryzyka = new LinkedHashSet<>();

		for (Oferta oferta : oferty) {
			for (OfertaSzczegoly szczegoly : oferta.getSzczegoly()) {

				Ryzyko ryzyko = ryzykaRepository
						.get(szczegoly.getId_produktu());

				if (ryzyko != null) {
					ryzykaStr.add(ryzyko.getSkrot());
					ryzyka.add(ryzyko);
				}
			}
		}

		model.addAttribute("ryzyka", ryzykaStr);

		// presentation form
		List<String> towarzystwa = new ArrayList<>();
		List<Map<String, Integer>> mapList = new ArrayList();

		for (Oferta oferta : oferty) {

			// towarzystwo
			towarzystwa.add(oferta.getTowarzystwo());
			Map<String, Integer> map = new LinkedHashMap<>();

			// stawki
			for (Ryzyko ryzyko : ryzyka) {

				Integer suma = 0;

				for (OfertaSzczegoly szczegoly : oferta.getSzczegoly()) {
					if (szczegoly.getId_produktu() == ryzyko.getId()) {
						suma += szczegoly.getWartosc_druga() != null ? szczegoly
								.getWartosc_druga() : 0;
					}
				}

				map.put(ryzyko.getSkrot(), suma);
			}

			Integer sumaAll = 0;

			for (Integer i : map.values()) {
				sumaAll += i;
			}

			map.put("Razem", sumaAll);

			System.out.println(map);
			
			mapList.add(map);
		}

		// usuwanie mniej atrakcyjnych ofert tego samego towarzystwa
		boolean flag = true;
		while(flag) {
			
			flag = false;
			
			for (int i = 0; i < towarzystwa.size(); i++) {
				  for (int j = 0; j < towarzystwa.size(); j++) {
					if(i==j) {
						continue;
					}
					if (towarzystwa.get(i).equals(towarzystwa.get(j))) {
						if (mapList.get(i).get("Razem") <= mapList.get(j).get(
								"Razem")) {
							towarzystwa.remove((int)i);
							mapList.remove((int)i);
							flag = true;
						}
						else {
							towarzystwa.remove((int)j);
							mapList.remove((int)j);
							flag = true;
						}
					}
				}
			}
		}
		
		System.out.println(towarzystwa);
		System.out.println(mapList);

		model.addAttribute("towarzystwa", towarzystwa);
		model.addAttribute("mapList", mapList);

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

		// save offer?
		for (Ryzyko p : ryzyka) {
			ofertyForm.getSaveMap().put(p.getId(), false); // false == save
		}

		model.addAttribute("ofertyForm", ofertyForm);

		return "dodaj-oferte";
	}

	@RequestMapping(value = "/baza-klientow/klient/oferta/proceed", method = RequestMethod.POST)
	public String proceedAddOffer(
			@ModelAttribute(value = "ofertyForm") OfertyForm ofertyForm,
			@RequestParam(value = "pdfData", required = false) CommonsMultipartFile file,
			ModelMap model) {

		for (Oferta p : ofertyRepository.getAllOfClient(ofertyForm.klientEmail)) {
			if (ofertyForm.getDzien().equals(p.getDzien())
					&& ofertyForm.getMiesiac().endsWith(p.getMiesiac())
					&& ofertyForm.getRok().equals(p.getRok())) {
				model.addAttribute("result", "error");
				return printClientPage(ofertyForm.getKlientEmail(), model);
			}
		}

		Oferta oferta = new Oferta();
		oferta.setKlientEmail(ofertyForm.getKlientEmail());
		oferta.setTowarzystwo(ofertyForm.getTowarzystwo());
		oferta.setRok(ofertyForm.getRok());
		oferta.setMiesiac(ofertyForm.getMiesiac());
		oferta.setDzien(ofertyForm.getDzien());

		oferta.setPdfData(file.getBytes());

		oferta.setPdfName(ofertyForm.getTowarzystwo() + " "
				+ ofertyForm.getDzien() + "-" + ofertyForm.getMiesiac() + "-"
				+ ofertyForm.getRok() + ".pdf");

		Iterator<OfertaSzczegoly> iterator = ofertyForm.getList().iterator();
		while (iterator.hasNext()) {

			OfertaSzczegoly p = iterator.next();

			p.setOferta(oferta);

			for (Integer idRyzyka : ofertyForm.getSaveMap().keySet()) {
				if (ofertyForm.getSaveMap().get(idRyzyka) != null
						&& ofertyForm.getSaveMap().get(idRyzyka)
						&& p.getId_produktu() == idRyzyka) {
					iterator.remove();
				}
			}
		}

		oferta.setSzczegoly(ofertyForm.getList());

		ofertyRepository.addOferta(oferta);

		model.addAttribute("result", "success");

		return printClientPage(ofertyForm.getKlientEmail(), model);
	}

	@RequestMapping(value = "/baza-klientow/klient/oferta/check/{ofertaId}", method = RequestMethod.POST)
	public String printOfferPage(ModelMap model,
			@PathVariable(value = "ofertaId") Integer ofertaId) {

		Oferta oferta = ofertyRepository.getById(ofertaId);

		User klient = usersRepository.findByEmail(oferta.getKlientEmail());

		List<Ryzyko> ryzyka = ryzykaRepository.getAllRyzyka();

		List<RodzajPojazdu> pojazdy = rodzajePojazdowRepository
				.getAllRodzajePojazdow();

		model.addAttribute("pojazdy", pojazdy);
		model.addAttribute("klient", klient);
		model.addAttribute("oferta", oferta);
		model.addAttribute("ryzyka", ryzyka);

		return "oferta";
	}

	@RequestMapping(value = "/oferta/download/{ofertaId}", method = RequestMethod.POST)
	@ResponseBody
	public byte[] proceedDownloadPdf(@PathVariable Integer ofertaId,
			ModelMap model) {
		return ofertyRepository.getById(ofertaId).getPdfData();
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

	Map<Integer, Boolean> saveMap = new HashMap<>();

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

	public Map<Integer, Boolean> getSaveMap() {
		return saveMap;
	}

	public void setSaveMap(Map<Integer, Boolean> saveMap) {
		this.saveMap = saveMap;
	}

	public OfertyForm() {
	}
}