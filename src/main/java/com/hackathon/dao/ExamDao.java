package com.hackathon.dao;

import java.util.List;

import com.hackathon.model.Answer;
import com.hackathon.model.Exam;
import com.hackathon.model.Question;
import com.hackathon.model.Score;
import com.hackathon.model.Student;
import com.hackathon.model.Subject;

public interface ExamDao {
	
	// get all distinct subject names
	public List<String> getSubjectNames();
	
	//list of subject id order by difficulty
	public List<String> getOrderedSubjectIds(String subjectName);
	
	//get exam id
	public String getExamId(String studentId, String subjectId);
	
	//get subject for id
	public Subject getSubject(String subjectId);
	
	//fetch question for id
	public Question getQuestion(String questionId);
	
	//get student for id
	public Student getStudent(String studentId);
	
	//create Exam
	public void createExam(Exam exam);
	
	//get exam for id
	public Exam getExam(String examId);
	public boolean addAnswer(Answer answer);
	public List<Answer> getAnswers(Exam exam);
	
	public void createScore(Score score);

}
