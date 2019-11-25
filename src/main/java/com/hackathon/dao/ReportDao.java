package com.hackathon.dao;

import java.util.List;

public interface ReportDao {
	public List<Object[]> getReport(String studentId);
	public List<Object[]> searchStudent(String subName,String difficulty,int score);
	 public List<String> getSubjectlist();
	 public List<String> getDifficultylist();

}