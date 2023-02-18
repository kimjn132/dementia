package com.springlec.base.service;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Service
public class RServiceImpl implements RService {

	
	public void PredictDementia(HttpServletRequest request, Model model) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		ServletContext context=session.getServletContext();
		String path=context.getRealPath("/");
		path=path.replaceAll("\\\\", "/");
		
		
		int Age = Integer.parseInt(request.getParameter("Age"));
		int EDUC = Integer.parseInt(request.getParameter("EDUC"));
		int SES = Integer.parseInt(request.getParameter("SES"));
		int MMSE = Integer.parseInt(request.getParameter("MMSE"));
		int SexCode = Integer.parseInt(request.getParameter("SexCode"));
		
		
		System.out.println(Age);
		System.out.println(EDUC);
		System.out.println(SES);
		System.out.println(MMSE);
		System.out.println(SexCode);
		
		
		RConnection conn = new RConnection();
		
		conn.voidEval("library(randomForest)");
		conn.voidEval("setwd('" + path + "')");
		conn.voidEval("machine <- readRDS('random_dementia.rds','rb')");
		conn.voidEval("result=as.character(predict(machine,list(Age=" + Age + ", EDUC=" + EDUC + ", SES=" + SES + ", MMSE=" + MMSE + ", SexCode=" + SexCode + ")))");
		
		String result = conn.eval("result").asString();
		
		model.addAttribute("ITEM", result);
		
		conn.close();
		
	}

	public void PredictDementiaReg(HttpServletRequest request, Model model) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		ServletContext context=session.getServletContext();
		String path=context.getRealPath("/");
		path=path.replaceAll("\\\\", "/");
		
		int Age = Integer.parseInt(request.getParameter("Age"));
		int EDUC = Integer.parseInt(request.getParameter("EDUC"));
		int SES = Integer.parseInt(request.getParameter("SES"));
		int MMSE = Integer.parseInt(request.getParameter("MMSE"));
		int SexCode = Integer.parseInt(request.getParameter("SexCode"));
		
		System.out.println(Age+"ghgh");
		System.out.println(EDUC);
		System.out.println(SES);
		System.out.println(MMSE);
		System.out.println(SexCode);
		
		RConnection conn = new RConnection();
		
		conn.voidEval("library(randomForest)");
		conn.voidEval("setwd('" + path + "')");
		conn.voidEval("machine <- readRDS('randomRegres4_dementia.rds','rb')");
		conn.voidEval("result=as.character(predict(machine,list(Age=" + Age + ", EDUC=" + EDUC + ", SES=" + SES + ", MMSE=" + MMSE + ", SexCode=" + SexCode + ")))");

		String result = conn.eval("result").asString();
		
		model.addAttribute("ITEM", result);
		
		conn.close();
		
	}

	@Override
	public void Index(HttpServletRequest request, Model model) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
