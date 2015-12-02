package application.persistance.users.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

	@Id
	@Column(name = "email", nullable = false, unique = true)
	private String email;

	@Column(name = "password", nullable = false)
	private String password;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Role> role = new HashSet<>();

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "user")
	private UserInfo user_info;

	public User(String email, String password, Set<Role> role,
			UserInfo user_info) {
		this.email = email;
		this.password = password;
		this.role = role;
		this.user_info = user_info;
	}

	public User() {
	}

	public User(String email, String password) {
		this.email = email;
		this.password = password;
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

	public UserInfo getUser_info() {
		return user_info;
	}

	public void setUser_info(UserInfo user_info) {
		this.user_info = user_info;
	}

	public static class UserDto {

		private String email;

		private String imie;

		private String nazwisko;

		private String firma;

		private String towarzystwo;

		private String telefon;

		private String ulica;

		private String kodPocztowy;

		private String miasto;

		private String region;

		private String nip;

		public User build() {
			UserInfo info = new UserInfo(imie, nazwisko, firma, towarzystwo,
					telefon, ulica, kodPocztowy, miasto, region, nip);

			User user = new User(email, "unset_password", null, info);

			return user;
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

		public String getKodPocztowy() {
			return kodPocztowy;
		}

		public void setKodPocztowy(String kodPocztowy) {
			this.kodPocztowy = kodPocztowy;
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

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

	}

}