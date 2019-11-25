package com.hackathon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hackathon.dao.AdminDaoIntf;
import com.hackathon.dao.ExamDao;
import com.hackathon.model.Admin;
import com.hackathon.model.Subject;
@Service("adminservice")
public class AdminServiceImpl implements AdminServiceIntf {
	
	@Autowired
	private AdminDaoIntf admindao;
	
	@Transactional
	public boolean loginAdmin(Admin admin) {
		return admindao.loginAdmin(admin);
	}

	@Transactional
	public boolean addSubject(Subject subject) {
		return admindao.addSubject(subject);
	}
	@Transactional
	public List<Subject> getSubjects() {
		return admindao.getSubjects();
	}
	
	@Transactional
	public boolean removeSubject(String subjectId){
		return admindao.removeSubject(subjectId);
	}

}
