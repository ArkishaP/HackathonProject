package com.hackathon.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.hackathon.model.Student;

@Repository("studentDao")
public class StudentDaoImpl implements StudentDao {
	@PersistenceContext
	EntityManager em;
	
	public boolean registerStudent(Student student) {
		boolean flag = false;
		try{
			em.persist(student);
			flag = true;
			}catch(Exception e){
				System.out.println("Error:"+e);
			}
			return flag;
	}

	public boolean loginStudent(Student student) {
		boolean flag= false;
		Student s =null;
		try{
			s=(Student)em.createQuery("SELECT s FROM Student s WHERE s.studentId=:id and s.password=:pwd")
		         .setParameter("id", student.getStudentId())
		         .setParameter("pwd",student.getPassword())
		         .getSingleResult();
		}
		catch(Exception e) {System.out.println(e); }
		if (s!=null)
			flag=true;
		System.out.println(s);
		return flag;
	}

	public boolean changepwd(String studentId,String opassword, String npassword) {
		  boolean flag=false;
		   
		  Query query = em.createQuery("update Student u set u.password=:npassword where u.studentId=:studentId and u.password=:opassword");
		  query.setParameter("studentId", studentId);
		  query.setParameter("opassword", opassword);
		  query.setParameter("npassword", npassword);
		  
		  
		  
		  int r = query.executeUpdate();
		  
		  em.close();
		  if(r>0)
			  flag=true;
		  return flag;
	  }
	public boolean changepassword(String studentId,String opassword, String npassword) {
		  boolean flag=false;
		   
		  Query query = em.createQuery("update Student u set u.password=:npassword where u.studentId=:studentId and u.password=:opassword");
		  query.setParameter("studentId", studentId);
		  query.setParameter("opassword", opassword);
		  query.setParameter("npassword", npassword);
		  
		  
		  
		  int r = query.executeUpdate();
		  
		  em.close();
		  if(r>0)
			  flag=true;
		  return flag;
	  }
}
