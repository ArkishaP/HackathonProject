package com.hackathon.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.hackathon.model.Answer;
import com.hackathon.model.Exam;
import com.hackathon.model.Question;
import com.hackathon.model.Score;
import com.hackathon.model.Student;
import com.hackathon.model.Subject;

@Repository("examDao")
public class ExamDaoImpl implements ExamDao {
	@PersistenceContext
	EntityManager em;
	
	// get all distinct subject names
	@SuppressWarnings("unchecked")
	public List<String> getSubjectNames() {
		List<String> subjects = new ArrayList<String>();		
		subjects = em.createQuery("Select DISTINCT s.subjectName from Subject s").getResultList();
		return subjects;
	}
	
	//list of subject id order by difficulty
	@SuppressWarnings("unchecked")
	public List<String> getOrderedSubjectIds(String subjectName){
		List<String> subjectIds = new ArrayList<String>();
		subjectIds = em.createQuery("SELECT s.subjectId from Subject s WHERE s.subjectName=:subjectName ORDER BY s.difficulty")
				.setParameter("subjectName", subjectName)
				.getResultList();
		return subjectIds;
		
	}
	
	//get exam id
	public String getExamId(String studentId, String subjectId){
		Student student = em.find(Student.class, studentId);
		Subject subject = em.find(Subject.class, subjectId);
		try{
		String examId = (String) em.createQuery("SELECT e.examId FROM Exam e WHERE e.subject=:subject AND e.student=:student")
				.setParameter("subject", subject)
				.setParameter("student", student)
				.getSingleResult();
		return examId;
		}catch(NoResultException nre){
			
		}
		return "";
	}
	
	//get subject for id
	public Subject getSubject(String subjectId){
		Subject subject = em.find(Subject.class, subjectId);
		return subject;
	}
	
	//fetch question for id
	public Question getQuestion(String questionId){
		Question question = em.find(Question.class, questionId);
		return question;
	}
	
	//get student for id
	public Student getStudent(String studentId) {
		Student student = em.find(Student.class, studentId);
		return student;
	}
		
	//create Exam
	public void createExam(Exam exam) {
		em.persist(exam);
	}
	
	//get exam for id
	public Exam getExam(String examId) {
		Exam exam = em.find(Exam.class, examId);
		return exam;
	}
	
	public boolean addAnswer(Answer answer) {
		em.persist(answer);
		return true;
	}
	

	@SuppressWarnings("unchecked")
	public List<Answer> getAnswers(Exam exam) {
		
		return (List<Answer>)em.createQuery("SELECT a from Answer a WHERE a.exam=:exam")
				.setParameter("exam", exam)
				.getResultList();
	}

	public void createScore(Score score){
		em.persist(score);
	}
}
