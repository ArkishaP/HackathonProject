package com.hackathon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hackathon.dao.ReportDao;

@Service("reportservice")
public class ReportServiceImpl implements ReportService{
@Autowired
 ReportDao reportDao;
@Transactional
public List<Object[]> getReport(String studentId){
	  List<Object[]> rlist = reportDao.getReport(studentId);
	  return rlist;
}
@Transactional
public List<Object[]> searchStudent(String subName,String difficulty,int score){
	return reportDao.searchStudent(subName, difficulty, score);
}

@Transactional
public List<String> getSubjectlist(){
	  return reportDao.getSubjectlist();
}
@Transactional
public List<String> getDifficultylist(){
	  return reportDao.getDifficultylist();
} 
}
