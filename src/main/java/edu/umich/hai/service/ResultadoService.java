package edu.umich.hai.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.umich.hai.domain.Resultado;

import javax.annotation.Resource;

import java.sql.Timestamp;
import java.util.List;

/**
 * Servicio para el objeto Resultado
 * 
 * @author William Aviles
 * 
 **/

@Service("resultadoService")
@Transactional
public class ResultadoService {
	
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Resultado> getResultados() {
		// Retrieve session from Hibernate
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Resultado");
		return query.list();
	}
	
	public Resultado getResultado(String idResult) {
		// Retrieve session from Hibernate
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Resultado res where res.idResult=:idResult");
		query.setParameter("idResult", idResult);
		return (Resultado) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Resultado> getResultadosFiltro(String sampleId, 
			Long desde, Long hasta, String resultLab, String sampleType, String estado, String usrResultado) {
		//Set the SQL Query initially
		String sqlQuery = "from Resultado res where 1 = 1";
		// if not null set time parameters
		if(!(desde==null)) {
			sqlQuery = sqlQuery + " and res.resultDate between :fechaInicio and :fechaFinal";
		}
		if (!(sampleId==null)) {
			sqlQuery = sqlQuery + " and res.sampleId =:sampleId";
		}
		if(!resultLab.equals("ALL")) {
			sqlQuery = sqlQuery + " and res.resultLab=:resultLab";
		}
		if(!estado.equals("ALL")) {
			sqlQuery = sqlQuery + " and res.estado=:estado";
		}
		if(!sampleType.equals("ALL")) {
			sqlQuery = sqlQuery + " and res.sampleType=:sampleType";
		}
		if(!usrResultado.equals("ALL")) {
			sqlQuery = sqlQuery + " and res.usrResult.username=:usrResultado";
		}
		
		// Retrieve session from Hibernate
		Session session = sessionFactory.getCurrentSession();
		// Create a Hibernate query (HQL)
		Query query = session.createQuery(sqlQuery);
		if(!(desde==null)) {
			Timestamp timeStampInicio = new Timestamp(desde);
			Timestamp timeStampFinal = new Timestamp(hasta);
			query.setTimestamp("fechaInicio", timeStampInicio);
			query.setTimestamp("fechaFinal", timeStampFinal);
		}
		if (!(sampleId==null)) {
			query.setParameter("sampleId", sampleId);
		}
		if(!resultLab.equals("ALL")) {
			query.setParameter("resultLab", resultLab);
		}
		if(!sampleType.equals("ALL")) {
			query.setParameter("sampleType", sampleType);
		}
		if(!estado.equals("ALL")) {
			
			query.setParameter("estado", estado.charAt(0));
		}
		if(!usrResultado.equals("ALL")) {
			query.setParameter("usrResultado", usrResultado);
		}
		
		// Retrieve all
		return  query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Resultado> getResultados2Entry() {
		// Retrieve session from Hibernate
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Resultado res where res.pasive = '0' and (res.estado='1' or res.estado='2')");
		return query.list();
	}

    /**
     * Guardar un formulario Resultado
     * @param result Resultado a guardar
     */
    public void saveResultado(Resultado result){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(result);
    }
}
