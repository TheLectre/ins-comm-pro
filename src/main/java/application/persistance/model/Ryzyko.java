package application.persistance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ryzyka")
public class Ryzyko {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	
	@Column(name="skrot")
	private String skrot;
	
	@Column(name="nazwa")
	private String nazwa;
	
	@Column(name="opis")
	private String opis;
	
	@Column(name="rodzaj")
	private String rodzaj;

	public Ryzyko(Integer id, String skrot, String nazwa, String opis,
			String rodzaj) {
		this.id = id;
		this.skrot = skrot;
		this.nazwa = nazwa;
		this.opis = opis;
		this.rodzaj = rodzaj;
	}

	public Ryzyko(String skrot, String nazwa, String opis,
			String rodzaj) {
		this.skrot = skrot;
		this.nazwa = nazwa;
		this.opis = opis;
		this.rodzaj = rodzaj;
	}

	public Ryzyko() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSkrot() {
		return skrot;
	}

	public void setSkrot(String skrot) {
		this.skrot = skrot;
	}

	public String getNazwa() {
		return nazwa;
	}

	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}

	public String getOpis() {
		return opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public String getRodzaj() {
		return rodzaj;
	}

	public void setRodzaj(String rodzaj) {
		this.rodzaj = rodzaj;
	}
	
}
