package com.hackathon.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository("reportDao")
public class ReportDaoImpl implements ReportDao{
	@PersistenceContext
	 EntityManager em;
	 public List<Object[]> getReport(String studentId){
		 
		 
			 @SuppressWarnings("unchecked")
			 String sql="SELECT st.id sid,st.first_name,su.name,su.difficulty,r.id scoreid,r.score,e.id examid FROM Student st,Subject su,score r,Exam e  where st.id=e.student_id and su.id=e.subject_id and e.id=r.exam_id and st.id=:id1";


			 List<Object[]> result = em.createNativeQuery(sql).setParameter("id1", studentId).getResultList();      
			for( Object[] i: result)
			{
			    System.out.println(i[0]);
			    System.out.println(i[1]);
			    System.out.println(i[2]);
			    System.out.println(i[3]);
			    System.out.println(i[4]);
			    System.out.println(i[5]);
			    System.out.println(i[6]);
			    
			}
			return result;
		  }

		public List<Object[]> searchStudent(String subName,String difficulty,int score){
			  @SuppressWarnings("unchecked")
			  String sql="SELECT st.id stid,st.first_name ,st.gender ,st.email, st.birth_date ,st.city ,st.state ,st.contact_number ,su.name ,su.difficulty ,e.id eid,e.date_of_exam ,e.time_taken ,r.score FROM Student st,Subject su,Exam e,Score r where st.id=e.student_id and su.id=e.subject_id and e.id=r.exam_id  and upper(su.name)=upper(:subName) and upper(su.difficulty)=upper(:difficulty) and r.score=:score" ;
				 List<Object[]> search= em.createNativeQuery(sql).setParameter("subName", subName).setParameter("difficulty", difficulty).setParameter("score", score).getResultList(); 
				 System.out.println(search.size());
				 
					return search;
		}
		public List<String> getSubjectlist(){
			  @SuppressWarnings("unchecked")
			List<String> sub  = em.createNativeQuery("SELECT distinct name FROM  subject")
					  .getResultList();
			  return  sub;
		  }
		public List<String> getDifficultylist(){
			  @SuppressWarnings("unchecked")
			List<String> diff  = em.createNativeQuery("SELECT distinct difficulty FROM  subject")
					  .getResultList();
			  return  diff;
		  }

}