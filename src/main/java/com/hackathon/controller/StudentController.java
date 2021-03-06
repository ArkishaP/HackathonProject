package com.hackathon.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hackathon.model.Student;
import com.hackathon.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	StudentService studentService;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView getRegister(HttpSession session){
		ModelAndView mav=new ModelAndView();
		if(null==session.getAttribute("studentId"))
			mav.setViewName("StudentRegistration2");
		else
			mav.setViewName("redirect:/dashboard.do");			
		return mav;
	}
	
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView registerUser(HttpServletRequest request) throws ParseException{
		
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd"); 
		
		String studentid = request.getParameter("studentid");
		String first_name = request.getParameter("fname");
		String last_name = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Date dob=formatter.parse(request.getParameter("dob")); 
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String phoneno = request.getParameter("phoneno");
		
		
		Student student =new Student();
		student.setStudentId(studentid);
		student.setFirstName(first_name);
		student.setLastName(last_name);
		student.setGender(gender);
		student.setEmail(email);
		student.setPassword(password);
		student.setDob(dob);
		student.setCity(city);
		student.setState(state);
		student.setContactNumber(phoneno);;
		boolean flag=studentService.registerStudent(student);
		
		ModelAndView mav=new ModelAndView();
		if(flag)
			mav.setViewName("login2");
			else
			
			mav.setViewName("StudentRegistration2");
			
		return mav;
		

	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginUserget(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		if(null==session.getAttribute("studentId"))
			mav.setViewName("login2");
		else
			mav.setViewName("redirect:/dashboard.do");
		return mav;
	 }
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginUser(HttpServletRequest request) {
	    
		String studentId = request.getParameter("studentid");
		
		String password = request.getParameter("password");
		
		
		Student student =new Student();
		student.setStudentId(studentId);
		student.setPassword(password);
		
        boolean flag=studentService.loginStudent(student);
		
		ModelAndView mav=new ModelAndView();
		if(flag){
			mav.setViewName("redirect:/dashboard.do");
			HttpSession session = request.getSession();
			session.setAttribute("studentId", studentId);
		}
			else{
				mav.setViewName("login2");
				mav.addObject("message","Invalid Details");
			}
		return mav;
	  }
	@RequestMapping(value = "/studentlogout", method = RequestMethod.GET)
	public ModelAndView studentlogout(HttpServletRequest request) {
		 HttpSession session =request.getSession(false);
		 session.invalidate();
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("login2");
		 return mav;
	 }
	
	
	@RequestMapping(value = "/changepwd", method = RequestMethod.GET)
	  public ModelAndView changepwd1(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("ChangePassword");
	    return mav;
	  }
	
	
	@RequestMapping(value = "/changepwd", method = RequestMethod.POST)
	  public ModelAndView changepwd1(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
    String studentId=(String)session.getAttribute("studentId");
    String opassword= request.getParameter("opassword");
    String npassword= request.getParameter("npassword");
    
	boolean flag = studentService.changepwd(studentId,opassword,npassword);
    if(flag) {
	       ModelAndView mav = new ModelAndView("login2");
	       return mav;
	  }
    else {
    	ModelAndView mav = new ModelAndView("ChangePassword");
	       mav.addObject("message", "Please Enter Correct Details");
	       return mav;
    }
	}
	
	@RequestMapping(value = "/changepassword", method = RequestMethod.GET)
	  public ModelAndView changepassword1(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("ChangeUserPassword");
	    return mav;
	  }
	
	
	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	  public ModelAndView changepassword1(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
  String studentId=(String)session.getAttribute("studentId");
  String opassword= request.getParameter("opassword");
  String npassword= request.getParameter("npassword");
  
	boolean flag = studentService.changepassword(studentId,opassword,npassword);
  if(flag) {
	       ModelAndView mav = new ModelAndView("login2");
	       return mav;
	  }
  else {
  	ModelAndView mav = new ModelAndView("ChangeUserPassword");
	       mav.addObject("message", "Please Enter Correct Details");
	       return mav;
  }
	}
}
