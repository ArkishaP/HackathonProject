package com.hackathon.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hackathon.dao.ExamDao;
import com.hackathon.model.Answer;
import com.hackathon.model.Exam;
import com.hackathon.model.Question;
import com.hackathon.model.Score;
import com.hackathon.model.Student;
import com.hackathon.model.Subject;

@Service("examService")
public class ExamServiceImpl implements ExamService {
	@Autowired
	ExamDao examDao;
	
	@Transactional
	public List<String> getSubjectNames() {
		return examDao.getSubjectNames();
	}
	
	@Transactional
	//select subject id
	public String selectSubjectId(String studentId, String subjectName){
		String subjectId = "";
		List<String> subjectIds = examDao.getOrderedSubjectIds(subjectName);
		for(String sid: subjectIds){
			String examId = examDao.getExamId(studentId, sid);
			if(examId.isEmpty()){
				return sid;
			}
			
		}
		return "";
	}
	
	@Transactional
	//get subject for id
	public Subject getSubject(String subjectId){
		return examDao.getSubject(subjectId);
	}
	
	@Transactional
	//fetch question for id
	public Question getQuestion(String questionId){
		return examDao.getQuestion(questionId);
	}
	
	@Transactional
	//get student for id
	public Student getStudent(String studentId) { return examDao.getStudent(studentId);}
		
	@Transactional
	//create Exam
	public void createExam(Exam exam) { examDao.createExam(exam);}
	
	@Transactional
	public boolean finishExam(Map<String, String> questionmap, Exam exam) {
		boolean flag = false;
		for (Map.Entry mapElement : questionmap.entrySet()) {
			
			Answer answer = new Answer();
			//Exam exam = examDao.getExam(examId);
			String questionId = (String)mapElement.getKey();
			String response = (String)mapElement.getValue();
			if(response.equals(examDao.getQuestion(questionId).getCorrectAnswer())) {
				answer.setCorrect("true");
			}else {
				answer.setCorrect("false");
			}
			Question question = examDao.getQuestion(questionId);
//			String correct = question.getCorrectAnswer();
			answer.setAnswerId(exam.getExamId()+questionId);
			answer.setExam(exam);
			answer.setQuestion(question);
			answer.setResponse(response);
//			answer.setCorrect(correct);
			flag = examDao.addAnswer(answer);
			
			
        } 
		return flag;
	}
	
	@Transactional
	//
	public Score calculateScore(Exam exam){
		Score score =  new Score();
		int calculated=0;
		score.setScoreId("S"+exam.getExamId());
		score.setExam(exam);
		List<Answer> answers = new ArrayList<Answer>();
		answers = examDao.getAnswers(exam);
		for(Answer answer:answers){
			if(answer.getCorrect().equals("true")){
				calculated++;
			}
		}
		score.setScore((calculated*100)/answers.size());
		examDao.createScore(score);
		return score;
	}


	
}
