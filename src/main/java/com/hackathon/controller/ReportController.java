package com.hackathon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hackathon.service.ReportService;


@Controller
public class ReportController {
	@Autowired
	ReportService reportservice;

	@ModelAttribute("sublist")
	public List<String>  getSubjectStatus() {
		List<String> sublist = reportservice.getSubjectlist();
		return sublist;
	}

	@ModelAttribute("difficultylist")
	public List<String>  getDifficultyStatus() {
		List<String> difficultylist = reportservice.getDifficultylist();
		 		return difficultylist;
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView viewReport(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		String studentId=(String) session.getAttribute("studentId");
		List<Object[]>  replist = reportservice.getReport(studentId);
		
		 ModelAndView mav = new ModelAndView("report");
		 mav.addObject("replist", replist);
		 return mav;
	 }
	
	@RequestMapping(value="/adminSearch" , method=RequestMethod.GET)	
	public ModelAndView redirectSearchStudent(){
		ModelAndView mav = new ModelAndView("AdminSearch");
		 mav.addObject("subName",reportservice.getSubjectlist());
		 mav.addObject("difficulty",reportservice.getDifficultylist());

		return mav;
	}
	
	@RequestMapping(value="/adminSearch" , method=RequestMethod.POST)
	public ModelAndView searchStudent(HttpServletRequest request, HttpServletResponse response) {
		String subName=request.getParameter("subName");
		String difficulty= request.getParameter("difficulty");
		int score = Integer.parseInt(request.getParameter("score"));
		String astatus= request.getParameter("astatus");
		System.out.println(subName);
		System.out.println(difficulty);
		System.out.println(score);
		
		List<Object[]>  stlist = reportservice.searchStudent(subName, difficulty, score);
		
		//System.out.println("idhar");
		System.out.println(stlist.size());
		ModelAndView mavv = new ModelAndView();
		 mavv.setViewName("SearchedResult");
		 mavv.addObject("stlist", stlist);
		 return mavv;
	 }
}