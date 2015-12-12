package application.persistance.users.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

	@Id
	@Column(name = "email", nullable = false, unique = true)
	private String email;

	@Column(name = "password")
	private String password;
	
	@Column(name="typ")
	private String typ;
	
	@Column(name="imie")
	private String imie;
	
	@Column(name="nazwisko")
	private String nazwisko;
	
	@Column(name="firma")
	private String firma;
	
	@Column(name="towarzystwo")
	private String towarzystwo;
	
	@Column(name="telefon")
	private String telefon;
	
	@Column(name="ulica")
	private String ulica;
	
	@Column(name="kod")
	private String kod; //kod pocztowy
	
	@Column(name="miasto")
	private String miasto;
	
	@Column(name="region")
	private String region;
	
	@Column(name="nip")
	private String nip;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Role> role = new HashSet<>();

	public User() {
	}

	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [email=" + email + ", imie=" + imie + ", nazwisko="
				+ nazwisko + "]";
	}

	public Set<Role> getRole() {
		return role;
	}

	public void setRole(Set<Role> role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String login) {
		this.email = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTyp() {
		return typ;
	}

	public void setTyp(String typ) {
		this.typ = typ;
	}

	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getNazwisko() {
		return nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}

	public String getFirma() {
		return firma;
	}

	public void setFirma(String firma) {
		this.firma = firma;
	}

	public String getTowarzystwo() {
		return towarzystwo;
	}

	public void setTowarzystwo(String towarzystwo) {
		this.towarzystwo = towarzystwo;
	}

	public String getTelefon() {
		return telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	public String getUlica() {
		return ulica;
	}

	public void setUlica(String ulica) {
		this.ulica = ulica;
	}

	public String getKod() {
		return kod;
	}

	public void setKod(String kod) {
		this.kod = kod;
	}

	public String getMiasto() {
		return miasto;
	}

	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getNip() {
		return nip;
	}

	public void setNip(String nip) {
		this.nip = nip;
	}

}