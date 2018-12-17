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
		@UniqueConstraint(columnNames = {"SAMPLE_ID","RESULT_DATE","RESULT_LAB"})})
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
	private String resH1N1pdmCA09;
	private String resH1N1pdmMI15;
	private String resNicaH3N2;
	private String resH3N2TX12;
	private String resH3N2SW13;
	private String resH3N2HK14;
	private String resBPH13;
	private String resBBR08;
	private String resNicaB;
	private String resNicaYamagata;
	private String resNicaVictoria;
	private String resultLab;
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
	
	@Column(name = "SAMPLE_TYPE", nullable = false, length = 50)
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
	
	@Column(name = "RESULT_DATE", nullable = true)
	public Date getResultDate() {
		return resultDate;
	}
	public void setResultDate(Date resultDate) {
		this.resultDate = resultDate;
	}
	
	@Column(name = "H1N1pdm_CA09", nullable = true, length = 50)
	public String getResH1N1pdmCA09() {
		return resH1N1pdmCA09;
	}
	public void setResH1N1pdmCA09(String resH1N1pdmCA09) {
		this.resH1N1pdmCA09 = resH1N1pdmCA09;
	}
	
	@Column(name = "H1N1pdm_MI15", nullable = true, length = 50)
	public String getResH1N1pdmMI15() {
		return resH1N1pdmMI15;
	}
	public void setResH1N1pdmMI15(String resH1N1pdmMI15) {
		this.resH1N1pdmMI15 = resH1N1pdmMI15;
	}
	@Column(name = "Nica_H3N2", nullable = true, length = 50)
	public String getResNicaH3N2() {
		return resNicaH3N2;
	}
	public void setResNicaH3N2(String resNicaH3N2) {
		this.resNicaH3N2 = resNicaH3N2;
	}
	@Column(name = "H3N2_TX12", nullable = true, length = 50)
	public String getResH3N2TX12() {
		return resH3N2TX12;
	}
	public void setResH3N2TX12(String resH3N2TX12) {
		this.resH3N2TX12 = resH3N2TX12;
	}
	@Column(name = "H3N2_SW13", nullable = true, length = 50)
	public String getResH3N2SW13() {
		return resH3N2SW13;
	}
	public void setResH3N2SW13(String resH3N2SW13) {
		this.resH3N2SW13 = resH3N2SW13;
	}
	@Column(name = "H3N2_HK14", nullable = true, length = 50)
	public String getResH3N2HK14() {
		return resH3N2HK14;
	}
	public void setResH3N2HK14(String resH3N2HK14) {
		this.resH3N2HK14 = resH3N2HK14;
	}
	@Column(name = "B_PH13", nullable = true, length = 50)
	public String getResBPH13() {
		return resBPH13;
	}
	public void setResBPH13(String resBPH13) {
		this.resBPH13 = resBPH13;
	}
	@Column(name = "B_BR08", nullable = true, length = 50)
	public String getResBBR08() {
		return resBBR08;
	}
	public void setResBBR08(String resBBR08) {
		this.resBBR08 = resBBR08;
	}
	@Column(name = "Nica_B", nullable = true, length = 50)
	public String getResNicaB() {
		return resNicaB;
	}
	public void setResNicaB(String resNicaB) {
		this.resNicaB = resNicaB;
	}
	@Column(name = "Nica_Yamagata", nullable = true, length = 50)
	public String getResNicaYamagata() {
		return resNicaYamagata;
	}
	public void setResNicaYamagata(String resNicaYamagata) {
		this.resNicaYamagata = resNicaYamagata;
	}
	@Column(name = "Nica_Victoria", nullable = true, length = 50)
	public String getResNicaVictoria() {
		return resNicaVictoria;
	}
	public void setResNicaVictoria(String resNicaVictoria) {
		this.resNicaVictoria = resNicaVictoria;
	}
	@Column(name = "file", nullable = true, length = 50)
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
