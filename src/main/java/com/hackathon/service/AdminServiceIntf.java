package com.hackathon.service;

import java.util.List;

import com.hackathon.model.Admin;
import com.hackathon.model.Subject;

public interface AdminServiceIntf {
	
	public boolean loginAdmin(Admin admin);
	public boolean addSubject(Subject subject);
	public List<Subject> getSubjects();
	public boolean removeSubject(String subjectId);

}
