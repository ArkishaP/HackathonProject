package com.hackathon.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
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
import com.hackathon.model.Score;
import com.hackathon.model.Student;
import com.hackathon.model.Subject;
import com.hackathon.service.ExamService;

@Controller
public class ExamController {
	@Autowired
	ExamService examService;
	
	@RequestMapping(value="/index")
	public ModelAndView notfound(HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(null==session.getAttribute("studentId"))
			mav.setViewName("index");
		else
			mav.setViewName("redirect:/dashboard.do");
		return mav;
	}
	
	@RequestMapping(value="/dashboard", method = RequestMethod.GET)
	public ModelAndView selectSubject(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(null==session.getAttribute("studentId")){
			mav.setViewName("redirect:/login.do");
		}else{
		String status = request.getParameter("status");
		if(status!=null){
			mav.addObject("message","you have completed all exams of this subject");
		}
		mav.addObject("subjects",examService.getSubjectNames());
		mav.setViewName("dashboard");
		}
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
			mav.setViewName("redirect:/dashboard.do?status=completed");
		}else if(subjectName==null){
			mav.setViewName("redirect:/dashboard.do");
		}
		else{
			session.setAttribute("subject", subject);
			mav.addObject("subject", subject);
			mav.setViewName("instructions");
		}
		return mav;
	}
	
	@RequestMapping(value="/startexam")
	public ModelAndView startExam(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//get subject and student -> create exam
		String studentId = (String) session.getAttribute("studentId");
		Student student = examService.getStudent(studentId);
		Subject subject = (Subject) session.getAttribute("subject");
		int startTimeMin = subject.getDuration();
		int startTimeSec = 01;
		//create new exam
		Exam exam = new Exam();
		exam.setStudent(student);
		exam.setSubject(subject);
		exam.setExamId(studentId+subject.getSubjectId());
		exam.setDateOfExam(new Date());
		examService.createExam(exam);
		mav.addObject("subject", subject);
		session.setAttribute("exam", exam);
		Map<String, String> questionmap = new HashMap<String, String>();
		for(Question question:subject.getQuestions()) {
			questionmap.put(question.getQuestionId(), "");
		}
		session.setAttribute("startTimeMin", startTimeMin);
		session.setAttribute("startTimeSec", startTimeSec);
		session.setAttribute("questionmap", questionmap);
		mav.setViewName("startexam");
		return mav;
	}
	
	@RequestMapping(value="/exam", method=RequestMethod.POST)
	public ModelAndView startExam(HttpServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(null==session.getAttribute("exam")){
			mav.setViewName("redirect:/dashboard.do");
		}else{
			Subject subject = (Subject) session.getAttribute("subject");
			String questionNo = request.getParameter("question");
			Question question = examService.getQuestion(questionNo);
			mav.addObject("subject", subject);
			mav.addObject("question",question);
			
			String questionId = request.getParameter("questionId");
			String studentAnswer = request.getParameter("response");
			String startTimeMin = request.getParameter("startTimeMin");
			String startTimeSec = request.getParameter("startTimeSec");
			if(questionId!=null){
				Map<String, String> questionmap = (Map<String, String>) session.getAttribute("questionmap");
				questionmap.replace(questionId, studentAnswer);
				session.setAttribute("startTimeMin", startTimeMin);
				session.setAttribute("startTimeSec", startTimeSec);
			}
			mav.setViewName("exampage");
		}
		return mav;
	}
	
	@RequestMapping(value="/finishexam")
	public ModelAndView finishExam(HttpSession session){
		ModelAndView mav = new ModelAndView();
		Exam exam = (Exam)session.getAttribute("exam");
		boolean flag = examService.finishExam((Map<String, String>)session.getAttribute("questionmap"), exam);
		
		if(flag){
			mav.setViewName("redirect:/report.do");
			Score score = examService.calculateScore(exam);
			session.removeAttribute("exam");
		}
			
		else
			mav.setViewName("error");
		return mav;
	}
	
}
