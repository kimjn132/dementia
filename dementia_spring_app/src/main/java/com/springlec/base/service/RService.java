package com.springlec.base.service;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;


@Service
public interface RService {
	
	public void PredictDementia(HttpServletRequest request, Model model) throws Exception;
	
	public void PredictDementiaReg(HttpServletRequest request, Model model) throws Exception;
	
	public void Index(HttpServletRequest request, Model model) throws Exception;

}
