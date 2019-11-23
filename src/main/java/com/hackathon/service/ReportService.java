package com.hackathon.service;

import java.util.List;

public interface ReportService {
	public List<Object[]> getReport(String studentId);
	public List<Object[]> searchStudent(String subjectName,String difficulty,int score);


}