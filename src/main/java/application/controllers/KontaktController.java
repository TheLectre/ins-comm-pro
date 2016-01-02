package application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KontaktController {

	@RequestMapping(value="/kontakt")
	public String printKontaktPage() {
		
		return "kontakt";
	}
	
}
