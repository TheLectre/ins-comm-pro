package application.persistance.towarzystwa.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tus")
public class Towarzystwo {
	
	@Id
	@Column(name="nazwa", nullable = false, unique = true)
	private String nazwa;

	@Column(name="oc")
	private Integer oc; //poziom szkodowy OC w %
	
	@Column(name="ac")
	private Integer ac;
	
	@Column(name="logo_data")
	private byte[] logoData;
	
	@Column(name="logo_name")
	private String logoName;
	
	public Towarzystwo() {
		super();
	}

	public Towarzystwo(String nazwa, Integer oc, Integer ac, byte[] logoData,
			String logoName) {
		this.nazwa = nazwa;
		this.oc = oc;
		this.ac = ac;
		this.logoData = logoData;
		this.logoName = logoName;
	}

	@Override
	public String toString() {
		return nazwa;
	}

	public String getNazwa() {
		return nazwa;
	}

	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}

	public Integer getOc() {
		return oc;
	}

	public void setOc(Integer oc) {
		this.oc = oc;
	}

	public Integer getAc() {
		return ac;
	}

	public void setAc(Integer ac) {
		this.ac = ac;
	}

	public byte[] getLogoData() {
		return logoData;
	}

	public void setLogoData(byte[] logoData) {
		this.logoData = logoData;
	}

	public String getLogoName() {
		return logoName;
	}

	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}
}
