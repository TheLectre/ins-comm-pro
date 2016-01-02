package application.persistance.model;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapKeyColumn;
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
	
	@Column(name="klient_firma")
	private String firma;
	
	@Column(name="klient_agent")
	private String agent; //jako string, ta sama klasa
	
	@ElementCollection(fetch=FetchType.EAGER)
	@CollectionTable(name="pracownicy", joinColumns=@JoinColumn(name="email"))
	@MapKeyColumn(name="towarzystwo", nullable=false)
	@Column(name="pracownik")
	private Map<String, String> pracownicy;
	
	@ElementCollection(fetch=FetchType.EAGER)
	@CollectionTable(name="klient_pojazdy", joinColumns=@JoinColumn(name="email"))
	@MapKeyColumn(name="id_pojazdu", nullable=false)
	@Column(name="ilosc")
	private Map<Integer, Integer> pojazdy;
	
	@Column(name="klient_floty")
	private Boolean klientFloty;
	
	@Column(name="klient_gwarancje")
	private Boolean klientGwarancje;
	
	@Column(name="klient_majatek_i_oc")
	private Boolean klientMajatekIOc;
	
	@Column(name="klient_grupowe")
	private Boolean klientGrupowe;
	
	@Column(name="klient_uwagi")
	private String klientUwagi;
	
	@Column(name="towarzystwo_nazwa")
	private String towarzystwo;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Role> role = new HashSet<>();

	public User() {
		pracownicy = new HashMap<>();
		pojazdy = new HashMap<>();
	}

	public User(String email, String password) {
		this();
		this.email = email;
		this.password = password;
	}

	@Override
	public String toString() {
		return email;
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
	
	public Map<String, String> getPracownicy() {
		return pracownicy;
	}

	public void setPracownicy(Map<String, String> pracownicy) {
		this.pracownicy = pracownicy;
	}

	public String getNazwisko() {
		return nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}
	
	public Boolean getKlientFloty() {
		return klientFloty;
	}

	public void setKlientFloty(Boolean klientFloty) {
		this.klientFloty = klientFloty;
	}

	public Boolean getKlientGwarancje() {
		return klientGwarancje;
	}

	public void setKlientGwarancje(Boolean klientGwarancje) {
		this.klientGwarancje = klientGwarancje;
	}

	public Boolean getKlientMajatekIOc() {
		return klientMajatekIOc;
	}

	public void setKlientMajatekIOc(Boolean klientMajatekIOc) {
		this.klientMajatekIOc = klientMajatekIOc;
	}

	public Boolean getKlientGrupowe() {
		return klientGrupowe;
	}

	public void setKlientGrupowe(Boolean klientGrupowe) {
		this.klientGrupowe = klientGrupowe;
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

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public Map<Integer, Integer> getPojazdy() {
		return pojazdy;
	}

	public void setPojazdy(Map<Integer, Integer> pojazdy) {
		this.pojazdy = pojazdy;
	}

	public String getKlientUwagi() {
		return klientUwagi;
	}

	public void setKlientUwagi(String klientUwagi) {
		this.klientUwagi = klientUwagi;
	}
	
	

}