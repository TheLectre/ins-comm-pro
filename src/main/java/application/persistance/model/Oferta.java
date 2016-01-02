package application.persistance.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="oferty")
public class Oferta {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	
	@Column(name="email")
	private String klientEmail;
	
	@Column(name="towarzystwo")
	private String towarzystwo;
	
	@Column(name="rok")
	private String rok;
	
	@Column(name="miesiac")
	private String miesiac;
	
	@Column(name="dzien")
	private String dzien;
	
	@Column(name="pdf_data")
	private byte[] pdfData;
	
	@Column(name="pdf_name")
	private String pdfName;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "oferta")
	List<OfertaSzczegoly> szczegoly;

	public Oferta() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKlientEmail() {
		return klientEmail;
	}

	public void setKlientEmail(String klientEmail) {
		this.klientEmail = klientEmail;
	}

	public String getTowarzystwo() {
		return towarzystwo;
	}

	public void setTowarzystwo(String towarzystwo) {
		this.towarzystwo = towarzystwo;
	}

	public String getRok() {
		return rok;
	}

	public void setRok(String rok) {
		this.rok = rok;
	}

	public String getMiesiac() {
		return miesiac;
	}

	public void setMiesiac(String miesiac) {
		this.miesiac = miesiac;
	}

	public String getDzien() {
		return dzien;
	}

	public void setDzien(String dzien) {
		this.dzien = dzien;
	}

	public List<OfertaSzczegoly> getSzczegoly() {
		return szczegoly;
	}

	public void setSzczegoly(List<OfertaSzczegoly> szczegoly) {
		this.szczegoly = szczegoly;
	}

	public byte[] getPdfData() {
		return pdfData;
	}

	public void setPdfData(byte[] pdfData) {
		this.pdfData = pdfData;
	}

	public String getPdfName() {
		return pdfName;
	}

	public void setPdfName(String pdfName) {
		this.pdfName = pdfName;
	}
}
