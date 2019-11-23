package com.hackathon.service;

import java.util.List;

import com.hackathon.model.Exam;
import com.hackathon.model.Question;
import com.hackathon.model.Student;
import com.hackathon.model.Subject;

public interface ExamService {
	
	// get distinct subject names
	public List<String> getSubjectNames();
	
	//select subject id
	public String selectSubjectId(String studentId, String subjectName);
	
	//get subject for id
	public Subject getSubject(String subjectId);
	
	//fetch question for id
	public Question getQuestion(String questionId);
	
	//get student for id
	public Student getStudent(String studentId);
		
	//create Exam
	public void createExam(Exam exam);
/*	
	//method to select level for student returns subjectId
	public String selectExam(String studentId, String subjectName);
	
	//method to return exam id
	public String startExam(String subjectId, String studentId);
	
	//generate questions
	public List<Question> getQuestions(String subjectId);
	
	
	*/
	
}
