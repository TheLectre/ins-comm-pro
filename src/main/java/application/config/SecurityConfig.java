package application.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("usersSecurityService")
	private UserDetailsService userDetailsService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth)
			throws Exception {
		auth.userDetailsService(userDetailsService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);

		http.authorizeRequests().

		antMatchers("/home", "/").access("hasRole('ROLE_BASIC')")
				.antMatchers("/adduser").access("hasRole('ROLE_ADDUSER')")
				.antMatchers(HttpMethod.POST, "adduser/validate")
				.access("hasRole('ROLE_ADDUSER')")

				.antMatchers(HttpMethod.POST, "adduser/change-password")
				.access("hasRole('ROLE_BASIC')")
				
				.antMatchers("/user-list").access("hasRole('ROLE_VIEWUSERS')")

				.antMatchers("/user-list/edit-user")
				.access("hasRole('ROLE_EDITUSER')")
				.antMatchers(HttpMethod.POST, "/user-list/edit-user/proceed")
				.access("hasRole('ROLE_EDITUSER')")

				.antMatchers("/add-towarzystwo")
				.access("hasRole('ROLE_ADDTOWARZYSTWO')")
				.antMatchers(HttpMethod.POST, "/add-towarzystwo/upload")
				.access("hasRole('ROLE_ADDTOWARZYSTWO')")

				.and().formLogin().loginPage("/login")
				.failureUrl("/login?error=true").usernameParameter("email")
				.passwordParameter("password").and().logout()
				.logoutUrl("/logout").logoutSuccessUrl("/login?logout=true")
				.and().csrf();// .and().exceptionHandling().accessDeniedPage("/403");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
}