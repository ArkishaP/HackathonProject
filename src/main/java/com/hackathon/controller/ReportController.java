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

	@RequestMapping(value = "/viewGraph", method = RequestMethod.GET)
	public ModelAndView Graph(HttpSession session, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		String studentId=(String) session.getAttribute("studentId");
		mav.addObject("exam",request.getParameter("exam"));
		List<Object[]>  replist = reportservice.getReport(studentId);
		 mav.addObject("replist", replist);
		mav.setViewName("viewGraph");
		return mav;
	 }
	
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
		 ModelAndView mav = new ModelAndView();
		String studentId=(String) session.getAttribute("studentId");
		if(null==session.getAttribute("studentId")){
			mav.setViewName("redirect:/index.do");
		}else{
		List<Object[]>  replist = reportservice.getReport(studentId);
		mav.setViewName("report");
		 mav.addObject("replist", replist);
		}
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
		List<Object[]>  stlist = reportservice.searchStudent(subName, difficulty, score);
		ModelAndView mavv = new ModelAndView();
		 mavv.setViewName("SearchedResult");
		 mavv.addObject("stlist", stlist);
		 return mavv;
	 }
}