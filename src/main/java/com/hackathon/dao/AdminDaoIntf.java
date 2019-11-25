package com.hackathon.dao;

import java.util.List;

import com.hackathon.model.Admin;
import com.hackathon.model.Subject;

public interface AdminDaoIntf {
	public boolean loginAdmin(Admin admin);
	public boolean addSubject(Subject subject);
	public List<Subject> getSubjects();
	public boolean removeQuestion(String questionId);
	public boolean removeSubject(String subjectId);
	
}
