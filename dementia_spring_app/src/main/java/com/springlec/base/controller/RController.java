package com.springlec.base.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.springlec.base.service.RService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class RController {
	
	@Autowired
	RService service;
	
	@GetMapping("/dementia")
	public String Dementia(HttpServletRequest request, Model model) throws Exception{
		service.PredictDementia(request, model);
		return "result";
	}
	
	@GetMapping("/dementiareg")
	public String DementiaReg(HttpServletRequest request, Model model) throws Exception{
		service.PredictDementiaReg(request, model);
		return "result";
	}
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}

}
