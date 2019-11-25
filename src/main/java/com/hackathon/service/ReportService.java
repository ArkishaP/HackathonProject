package com.hackathon.service;

import java.util.List;

public interface ReportService {
	public List<Object[]> getReport(String studentId);
	public List<Object[]> searchStudent(String subjName,String difficulty,int score);
	public List<String> getSubjectlist();
	public List<String> getDifficultylist();

}