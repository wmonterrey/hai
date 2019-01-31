package edu.umich.hai.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.ForeignKey;

import edu.umich.hai.domain.audit.Auditable;
import edu.umich.hai.users.model.UserSistema;



@Entity
@Table(name = "results", catalog = "hai", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"SAMPLE_ID","RESULT_DATE","RESULT_LAB","ANTIGEN"})})
public class Resultado extends BaseMetaData implements Auditable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idResult;
	private String sampleId;
	private String sampleType;
	private Date sampleDate;
	private Date resultDate = new Date();
	private String resultLab;
	private String fluType;
	private String antigen;
	private String result;
	private String antigenAdditional;
	private UserSistema usrResult;
	private String obs;	
	private String file;
	
	@Id
	@Column(name = "ID_RESULT", nullable = false, length = 50)
	public String getIdResult() {
		return idResult;
	}
	public void setIdResult(String idResult) {
		this.idResult = idResult;
	}
	
	@Column(name = "SAMPLE_ID", nullable = false, length = 50)
	public String getSampleId() {
		return sampleId;
	}
	public void setSampleId(String sampleId) {
		this.sampleId = sampleId;
	}
	
	@Column(name = "SAMPLE_TYPE", nullable = true, length = 50)
	public String getSampleType() {
		return sampleType;
	}
	public void setSampleType(String sampleType) {
		this.sampleType = sampleType;
	}
	
	@Column(name = "SAMPLE_DATE", nullable = true)
	public Date getSampleDate() {
		return sampleDate;
	}
	public void setSampleDate(Date sampleDate) {
		this.sampleDate = sampleDate;
	}
	@Column(name = "RESULT_DATE", nullable = false)
	public Date getResultDate() {
		return resultDate;
	}
	public void setResultDate(Date resultDate) {
		this.resultDate = resultDate;
	}
	@Column(name = "FILE", nullable = true, length = 50)
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	@Column(name = "RESULT_LAB", nullable = false, length = 50)
	public String getResultLab() {
		return resultLab;
	}
	public void setResultLab(String resultLab) {
		this.resultLab = resultLab;
	}
	@Column(name = "FLU_TYPE", nullable = false, length = 50)
	public String getFluType() {
		return fluType;
	}
	public void setFluType(String fluType) {
		this.fluType = fluType;
	}
	@Column(name = "ANTIGEN", nullable = false, length = 50)
	public String getAntigen() {
		return antigen;
	}
	public void setAntigen(String antigen) {
		this.antigen = antigen;
	}
	@Column(name = "RESULT", nullable = false, length = 50)
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Column(name = "ANT_ADD_INFO", nullable = true, length = 250)
	public String getAntigenAdditional() {
		return antigenAdditional;
	}
	public void setAntigenAdditional(String antigenAdditional) {
		this.antigenAdditional = antigenAdditional;
	}
	@ManyToOne(optional=false)
	@JoinColumn(name="PROCESSING_USER")
	@ForeignKey(name = "RESULTS_USERS_FK")
	public UserSistema getUsrResult() {
		return usrResult;
	}
	public void setUsrResult(UserSistema usrResult) {
		this.usrResult = usrResult;
	}
	
	@Column(name = "OBS", nullable = true, length =500)
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
	
	@Override
	public boolean isFieldAuditable(String fieldname) {
		return true;
	}
	
	@Override
	public String toString(){
		return idResult;
	}
	
	@Override
	public boolean equals(Object other) {
		
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof Resultado))
			return false;
		
		Resultado castOther = (Resultado) other;

		return (this.getIdResult().equals(castOther.getIdResult()));
	}
	
}
