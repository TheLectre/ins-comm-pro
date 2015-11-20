package application.config;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@PropertySource("classpath:/private/db.properties")
@Configuration
public class DataSourceConfig {

	@Value("com.mysql.jdbc.Driver")
	private String driverClassName;
	
	@Value("jdbc:mysql://localhost:3306/cpro")
	private String url;
	
	@Value("user")
	private String username;
	
	@Value("password")
	private String password;
	
	@Bean(name="dataSource")
	public BasicDataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/cpro");
		dataSource.setUsername("user");
		dataSource.setPassword("password");
		
		return dataSource;
	}

}
