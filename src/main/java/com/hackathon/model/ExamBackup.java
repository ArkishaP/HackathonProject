package com.hackathon.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class ExamBackup {
	@Id
	@Column(name="id")
	private String examId;
	
	@ManyToOne
	@JoinColumn(name="student_id")
	private Student student;
	
	@ManyToOne
	@JoinColumn(name="subject_id")
	private Subject subject;
	@Temporal(TemporalType.DATE)
	@Column(name="date_of_exam")
	private Date dateOfExam;
	@Column(name="time_taken")
	private int timeTaken;
}
