package com.hackathon.dao;

import java.util.List;

public interface ReportDao {
	public List<Object[]> getReport(String studentId);
	public List<Object[]> searchStudent(String subjectName,String difficulty,int score);

}