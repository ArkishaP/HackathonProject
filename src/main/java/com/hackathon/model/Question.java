package com.hackathon.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/*CREATE TABLE question(
		id VARCHAR2(5) NOT NULL PRIMARY KEY,
		subject_id VARCHAR2(4) REFERENCES subject(id),
		question VARCHAR2(500),
		option1 VARCHAR2(500),
		option2 VARCHAR2(500),
		option3 VARCHAR2(500),
		option4 VARCHAR2(500),
		correct_answer VARCHAR2(500)
	);*/

@Entity
public class Question {
	@Id
	@Column(name="id")
	private String questionId;
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	@Column(name="correct_answer")
	private String correctAnswer;
	
	@ManyToOne
	@JoinColumn(name="subject_id")
	private Subject subject;

	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", question=" + question + ", option1=" + option1 + ", option2="
				+ option2 + ", option3=" + option3 + ", option4=" + option4 + ", correct_answer=" + correctAnswer
				+ "]";
	}

	public Question() {
		super();
	}

	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	
	
}
