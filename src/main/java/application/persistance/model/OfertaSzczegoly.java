package application.persistance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "oferty_szczegoly")
public class OfertaSzczegoly {

	@Id
	@GeneratedValue
	@Column(name = "identity")
	private Integer id;

	@Column(name = "id_produktu")
	private Integer id_produktu;

	@Column(name = "id_pojazdu")
	private Integer id_pojazdu;

	@Column(name = "wartosc_pierwsza")
	private Integer wartosc_pierwsza;

	@Column(name = "wartosc_druga")
	private Integer wartosc_druga;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_oferty", nullable = false)
	private Oferta oferta;

	public OfertaSzczegoly() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getId_produktu() {
		return id_produktu;
	}

	public void setId_produktu(Integer id_produktu) {
		this.id_produktu = id_produktu;
	}

	public Integer getWartosc_pierwsza() {
		return wartosc_pierwsza;
	}

	public void setWartosc_pierwsza(Integer wartosc_pierwsza) {
		this.wartosc_pierwsza = wartosc_pierwsza;
	}

	public Integer getWartosc_druga() {
		return wartosc_druga;
	}

	public void setWartosc_druga(Integer wartosc_druga) {
		this.wartosc_druga = wartosc_druga;
	}

	public Oferta getOferta() {
		return oferta;
	}

	public void setOferta(Oferta oferta) {
		this.oferta = oferta;
	}

	public Integer getId_pojazdu() {
		return id_pojazdu;
	}

	public void setId_pojazdu(Integer id_pojazdu) {
		this.id_pojazdu = id_pojazdu;
	}

}
