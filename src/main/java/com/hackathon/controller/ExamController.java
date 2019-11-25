package com.hackathon.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hackathon.model.Exam;
import com.hackathon.model.Question;
import com.hackathon.model.Student;
import com.hackathon.model.Subject;
import com.hackathon.service.ExamService;

@Controller
public class ExamController {
	@Autowired
	ExamService examService;
	
	@RequestMapping(value="/dashboard", method = RequestMethod.GET)
	public ModelAndView selectSubject() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("subjects",examService.getSubjectNames());
		mav.setViewName("dashboard");
		return mav;
	}

	@RequestMapping(value="/instruction")
	public ModelAndView getInstructions(HttpServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String subjectName = request.getParameter("subject");
		String studentId = (String)session.getAttribute("studentId");
		
		//need to find subjectid
		String subjectId = examService.selectSubjectId(studentId, subjectName);
		//get subject object
		Subject subject = examService.getSubject(subjectId);
		if(subject==null){
			//send message
			mav.setViewName("redirect:/dashboard.do");
		}else{
			session.setAttribute("subject", subject);
			mav.addObject("subject", subject);
			mav.setViewName("instructions");
		}
/*		String exam = examService.selectExam(studentId, subjectName);
		mav.addObject("subject", subjectName);
		mav.addObject("exam",exam);
		mav.setViewName("instructions");*/
		
		return mav;
	}
	
	@RequestMapping(value="/startexam")
	public ModelAndView startExam(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//get subject and student -> create exam
		String studentId = (String) session.getAttribute("studentId");
		Student student = examService.getStudent(studentId);
		Subject subject = (Subject) session.getAttribute("subject");
		//create new exam
		Exam exam = new Exam();
		exam.setStudent(student);
		exam.setSubject(subject);
		exam.setExamId("E0001");
		examService.createExam(exam);
		mav.addObject("subject", subject);
		session.setAttribute("exam", exam);
		Map<String, String> questionmap = new HashMap<String, String>();
		for(Question question:subject.getQuestions()) {
			questionmap.put(question.getQuestionId(), "");
		}
		session.setAttribute("questionmap", questionmap);
		mav.setViewName("startexam");
		return mav;
	}
	
	@RequestMapping(value="/exam", method=RequestMethod.POST)
	public ModelAndView startExam(HttpServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView();
		Subject subject = (Subject) session.getAttribute("subject");
		String questionNo = request.getParameter("question");
		Question question = examService.getQuestion(questionNo);
		mav.addObject("subject", subject);
		mav.addObject("question",question);
		
		String questionId = request.getParameter("questionId");
		String studentAnswer = request.getParameter("response");
		if(questionId!=null){
			Map<String, String> questionmap = (Map<String, String>) session.getAttribute("questionmap");
			questionmap.replace(questionId, studentAnswer);
		}
		mav.setViewName("exampage");
		return mav;
	}
	
	/*@RequestMapping(value="/setanswer", method = RequestMethod.POST)
	public ModelAndView setAnswer(HttpServletRequest request, HttpSession session, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		String questionNo = request.getParameter("questionno");
		String questionId = request.getParameter("questionId");
		String studentAnswer = request.getParameter("option");
		Map<String, String> questionmap = (Map<String, String>) session.getAttribute("questionmap");
		questionmap.replace(questionId, studentAnswer);
		ra.addFlashAttribute("questionno", questionNo);
		mav.addObject("");
		mav.setViewName("redirect:/exam.do");
		return mav;
	}*/
/*	
	@RequestMapping(value="/startexam", method=RequestMethod.GET)
	public ModelAndView redirectToExamPage(HttpServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView("exampage");
		String subjectName = request.getParameter("subject");
		String studentId = (String)session.getAttribute("studentId");
		mav.addObject("subject", subjectName);
		mav.addObject("student",studentId);
		String exam = examService.selectExam(studentId, subjectName);
		mav.addObject("exam", exam);
		mav.addObject("questions", examService.getQuestions(exam));
		System.out.println(exam);
		
		return mav;
	}
	*/
}
