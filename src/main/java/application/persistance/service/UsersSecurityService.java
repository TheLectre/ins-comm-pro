package application.persistance.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import application.persistance.dao.UserDao;
import application.persistance.model.Role;


@Service("usersSecurityService")
public class UsersSecurityService implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(final String username)
			throws UsernameNotFoundException {

		application.persistance.model.User user = userDao
				.findByEmail(username);
		List<GrantedAuthority> authorities = buildUserAuthority(user.getRole());

		return buildUserForAuthentication(user, authorities);

	}

	private User buildUserForAuthentication(
			application.persistance.model.User user,
			List<GrantedAuthority> authorities) {

		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		return new User(user.getEmail(), user.getPassword(), enabled,
				accountNonExpired, credentialsNonExpired, accountNonLocked,
				authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(Set<Role> userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<>();

		for (Role userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}

		// converting set to list
		List<GrantedAuthority> Result = new ArrayList<>(setAuths);

		return Result;
	}
}