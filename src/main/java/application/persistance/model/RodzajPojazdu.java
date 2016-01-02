package application.persistance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rodzaje_pojazdow")
public class RodzajPojazdu {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;

	@Column(name = "nazwa_rodzaju")
	private String nazwaRodzaju;
	
	public RodzajPojazdu(String nazwaRodzaju) {
		this.nazwaRodzaju = nazwaRodzaju;
	}
	
	public RodzajPojazdu(Integer id, String nazwaRodzaju) {
		this.id = id;
		this.nazwaRodzaju = nazwaRodzaju;
	}
	
	public RodzajPojazdu() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNazwaRodzaju() {
		return nazwaRodzaju;
	}

	public void setNazwaRodzaju(String nazwaRodzaju) {
		this.nazwaRodzaju = nazwaRodzaju;
	}

}
