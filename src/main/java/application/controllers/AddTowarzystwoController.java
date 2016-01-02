package application.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import application.persistance.dao.TowarzystwoDao;
import application.persistance.model.Towarzystwo;

@Controller
public class AddTowarzystwoController {

	@Autowired
	TowarzystwoDao repo;
	
	@RequestMapping(value = "/add-towarzystwo", method = RequestMethod.GET)
	public String printAddTowarzystwoPage(@RequestParam(value="result", required=false) String result, ModelMap model) {

		model.addAttribute("result", result);
		
		return "add-towarzystwo";
	}

	@RequestMapping(value = "/add-towarzystwo/upload", method = RequestMethod.POST)
	public String handleFileUpload(
			@RequestParam(value = "nazwa", required = true) String nazwa,
			@RequestParam(value = "oc", required = true) Integer oc,
			@RequestParam(value = "ac", required = true) Integer ac,
			@RequestParam(value = "logo", required = true) CommonsMultipartFile logo,
			ModelMap model) throws Exception {
		
		Towarzystwo tu = new Towarzystwo(nazwa, oc, ac, logo.getBytes(), logo.getOriginalFilename());

		repo.addTowarzystwo(tu);
		
		model.addAttribute("result", "success");

		return "add-towarzystwo";
	}
}
