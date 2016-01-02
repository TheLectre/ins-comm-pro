package application.persistance.util;

import java.util.HashSet;
import java.util.Set;

import application.persistance.model.Role;
import application.persistance.model.User;

public class RolesProvider {

	@SuppressWarnings("serial")
	public static Set<Role> provideRoles(User user) {
		Set<Role> roles = new HashSet<>();
		
		if(user.getTyp().equals("admin")) {
			roles.add(new Role(user, "ROLE_BASIC"));
			roles.add(new Role(user, "ROLE_ADDUSER"));
			roles.add(new Role(user, "ROLE_VIEWUSERS"));
			roles.add(new Role(user, "ROLE_ADDTOWARZYSTWO"));
			roles.add(new Role(user, "ROLE_EDITUSER"));
			roles.add(new Role(user, "ROLE_CHANGEDESCRIPTION"));
			roles.add(new Role(user, "ROLE_MANAGECLIENTS"));
		}
		else if(user.getTyp().equals("agent")) {
			roles.add(new Role(user, "ROLE_BASIC"));
			roles.add(new Role(user, "ROLE_ADDUSER"));
			roles.add(new Role(user, "ROLE_VIEWUSERS"));
			roles.add(new Role(user, "ROLE_ADDTOWARZYSTWO"));
			roles.add(new Role(user, "ROLE_EDITUSER"));
			roles.add(new Role(user, "ROLE_CHANGEDESCRIPTION"));
			roles.add(new Role(user, "ROLE_MANAGECLIENTS"));
		}
		else if(user.getTyp().equals("klient")) {
			roles.add(new Role(user, "ROLE_BASIC"));
		}
		else if(user.getTyp().equals("towarzystwo")) {
			roles.add(new Role(user, "ROLE_BASIC"));
			roles.add(new Role(user, "ROLE_MANAGECLIENTS"));
		}
		else {
			throw new IllegalArgumentException() {
				@Override
				public String getMessage() {
					return "Unknown type passed. Cannot provide roles.";
				}
			};
		}
		
		return roles;
	}
	
}
