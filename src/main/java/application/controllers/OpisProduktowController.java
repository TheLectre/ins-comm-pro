package application.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.persistance.dao.RodzajePojazdowDao;
import application.persistance.dao.RyzykaDao;
import application.persistance.model.RodzajPojazdu;
import application.persistance.model.Ryzyko;

@Controller
public class OpisProduktowController {

	@Autowired
	RodzajePojazdowDao rodzajePojazdowRepository;
	
	@Autowired
	RyzykaDao ryzykaRepository;

	@RequestMapping(value = "/opis-produktow", method = RequestMethod.GET)
	public String printOpisProduktowPage() {

		return "opis-produktow";
	}
	
	//RYZYKA

	@RequestMapping(value = "/rodzaje-ryzyk", method = RequestMethod.GET)
	public String printRodzajeRyzykPage(ModelMap model) {
		
		model.addAttribute("ryzyka", ryzykaRepository.getAllRyzyka());

		return "rodzaje-ryzyk";
	}

	@RequestMapping(value = "/rodzaje-ryzyk/proceed", method = RequestMethod.POST)
	public String proceedRyzykoChange(
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "skrot", required = true) String skrot,
			@RequestParam(value = "nazwa", required = true) String nazwa,
			@RequestParam(value = "opis", required = true) String opis,
			@RequestParam(value = "rodzaj", required = true) String rodzaj,
			ModelMap model) {

		if(ryzykaRepository.updateRyzyko(new Ryzyko(id, skrot, nazwa, opis, rodzaj))) {
			model.addAttribute("result", "success");
		}
		else {
			model.addAttribute("result", "error");
		}

		return "opis-produktow";
	}
	
	@RequestMapping(value = "/rodzaje-ryzyk/add", method = RequestMethod.POST)
	public String proceedRyzykoAdd(
			@RequestParam(value = "skrot", required = true) String skrot,
			@RequestParam(value = "nazwa", required = true) String nazwa,
			@RequestParam(value = "opis", required = true) String opis,
			@RequestParam(value = "rodzaj", required = false) String rodzaj,
			ModelMap model) {
		
		if(rodzaj == null) {
			rodzaj ="off";
		}
		
		if(ryzykaRepository.addRyzyko(new Ryzyko(skrot, nazwa, opis, (rodzaj.equals("on") ? "procent" : "standard")))) {
			model.addAttribute("result", "success");
		}
		else {
			model.addAttribute("result", "error");
		}

		return "opis-produktow";
	}
	
	@RequestMapping(value = "/rodzaje-ryzyk/delete", method = RequestMethod.POST)
	public String proceedRyzykoDelete(
			@RequestParam(value = "id", required = true) int id,
			ModelMap model) {
		
		ryzykaRepository.deleteRyzyko(id);
		
		model.addAttribute("result", "success");

		return "opis-produktow";
	}
	
	//POJAZDY

	@RequestMapping(value = "/rodzaje-pojazdow", method = RequestMethod.GET)
	public String printRodzajePojazdowPage(ModelMap model) {

		model.addAttribute("rodzajePojazdow",
				rodzajePojazdowRepository.getAllRodzajePojazdow());

		return "rodzaje-pojazdow";
	}

	@RequestMapping(value = "/rodzaje-pojazdow/proceed", method = RequestMethod.POST)
	public String proceedRodzajePojazdowChange(
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "nazwa", required = true) String nazwa,
			ModelMap model) {

		if(rodzajePojazdowRepository.updateRodzajPojazdu(new RodzajPojazdu(id, nazwa))) {
			model.addAttribute("result", "success");
		}
		else {
			model.addAttribute("result", "error");
		}

		return "opis-produktow";
	}

	@RequestMapping(value = "/rodzaje-pojazdow/add", method = RequestMethod.POST)
	public String proceedRodzajePojazdowAdd(
			@RequestParam(value = "nowyRodzaj", required = true) String nazwaPojazdu,
			ModelMap model) {

		if(rodzajePojazdowRepository.addRodzajPojazdu(new RodzajPojazdu(nazwaPojazdu))) {
			model.addAttribute("result", "success");
		}
		else {
			model.addAttribute("result", "error");
		}

		return "opis-produktow";
	}

}
