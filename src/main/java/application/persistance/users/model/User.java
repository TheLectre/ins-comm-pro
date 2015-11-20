package application.persistance.users.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@Column(name="email", nullable=false, unique=true)
	private String email;
	
	@Column(name="password", nullable=false)
	private String password;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Role> role = new HashSet<>();

	public User(String login, String password, Set<Role> role) {
		this.email = login;
		this.password = password;
		this.role = role;
	}

	public User(String login, String password) {
		this.email = login;
		this.password = password;
	}

	public User() {
		super();
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
	
}