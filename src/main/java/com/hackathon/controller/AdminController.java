package com.hackathon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hackathon.dao.AdminDaoIntf;
import com.hackathon.model.Admin;
import com.hackathon.service.AdminServiceIntf;
@Controller
public class AdminController {
	@Autowired
	AdminDaoIntf admindao;
	@Autowired
	AdminServiceIntf adminservice;

	@RequestMapping(value = "/adminDashboard", method = RequestMethod.GET)
	public ModelAndView Dashboard() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("AdminDashboard");
		return mav;
	 }
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public ModelAndView loginAdmin() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("Adminlogin");
		return mav;
	 }
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public ModelAndView loginAdmin(HttpServletRequest request) {
	    
		String username = request.getParameter("username");
		
		String password = request.getParameter("password");
		
		Admin admin = new Admin(); 
		admin.setUsername(username);
		admin.setPassword(password);
		
        boolean flag=adminservice.loginAdmin(admin);
		
		ModelAndView mav=new ModelAndView();
		if(flag)
			{
			mav.setViewName("redirect:/adminLogin.do");
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			mav.setViewName("AdminDashboard");
			}
			else
			
			{
				mav.setViewName("Adminlogin");
				mav.addObject("message","Invalid Credentials");
			}
		  
		return mav;
	  }

	@RequestMapping(value="/viewsubjects")
	public ModelAndView viewSubjects(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("subjects",adminservice.getSubjects());
		mav.setViewName("ViewSubjects");
		return mav;
	}
	
	@RequestMapping(value="/remove")
	public ModelAndView removeSubject(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String subjectId = request.getParameter("subject");
		boolean flag = adminservice.removeSubject(subjectId);
		
			mav.setViewName("redirect:/viewsubjects.do");
		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView userlogout(HttpServletRequest request) {
		 HttpSession session =request.getSession(false);
		 session.invalidate();
		 ModelAndView mav = new ModelAndView("Adminlogin");
		 mav.addObject("Adminlogin");
		 return mav;
	 }
}
