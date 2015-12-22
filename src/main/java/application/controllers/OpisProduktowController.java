package application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OpisProduktowController {

	@RequestMapping(value="/opis-produktow", method=RequestMethod.GET)
	public String printOpisProduktowPage() {
		
		return "opis-produktow";
	}
	
	@RequestMapping(value="/rodzaje-ryzyk", method=RequestMethod.GET)
	public String printRodzajeRyzykPage(ModelMap model) {
		
		
		
		return "rodzaje-ryzyk";
	}
	
	@RequestMapping(value="/rodzaje-pojazdow", method=RequestMethod.GET)
	public String printRodzajePojazdowPage() {
		
		return "rodzaje-pojazdow";
	}
	
}
