package kajetansw.bloglobe.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
@EnableWebMvc
@ComponentScan("kajetansw.bloglobe")
@PropertySource("classpath:persistence-mysql.properties")
public class AppConfig {

	// injected variable to hold properties from .properties
	@Autowired
	private Environment env;
    
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
    	
    	LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
    	
    	Properties properties = new Properties();
		properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		properties.put("hibernate.show_sql", "true");
    	
    	sessionFactoryBean.setDataSource(securityDataSource());
    	sessionFactoryBean.setPackagesToScan("kajetansw.bloglobe.entity");
    	sessionFactoryBean.setHibernateProperties(properties);
    	
    	return sessionFactoryBean;
    }

    @Bean
    public PlatformTransactionManager txManager() {
        //return new DataSourceTransactionManager(securityDataSource());
    	
    	HibernateTransactionManager hibernateTransactionManager = new HibernateTransactionManager();
    	
    	hibernateTransactionManager.setSessionFactory(sessionFactory().getObject());
    	
    	return hibernateTransactionManager;
       
    }
	
	// bean for ViewResolver
	@Bean
	public ViewResolver viewResolver() {
		
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		
		return viewResolver;
	}
	
	// bean for security DataSource
	@Bean
	public DataSource securityDataSource() {
		
		// create connection pool
		ComboPooledDataSource securityDataSource
			= new ComboPooledDataSource();

		System.out.println("##### jdbc.driver: " + env.getProperty("jdbc.driver"));
		System.out.println("##### jdbc.url: " + env.getProperty("jdbc.url"));
		System.out.println("##### jdbc.user: " + env.getProperty("jdbc.user"));
		System.out.println("##### jdbc.password: " + env.getProperty("jdbc.password"));
		
		// set JDBC driver class
		try {
			securityDataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		
		// set db connection props
		securityDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		securityDataSource.setUser(env.getProperty("jdbc.user"));
		securityDataSource.setPassword(env.getProperty("jdbc.password"));
		
		// set connection pool props
		securityDataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
		securityDataSource.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
		securityDataSource.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
		securityDataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));
		
		return securityDataSource;
	}
	
	
	// read env prop and convert to int
	private int getIntProperty(String propName) {
		
		String propVal = env.getProperty(propName);
		
		// convert to int 
		int intPropVal = Integer.parseInt(propVal);
		
		return intPropVal;
	}
	
	
	/*@Bean 
	public SessionFactory sessionFactory() {
		
		Properties properties = new Properties();
		
		properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.transaction.factory_class", "org.hibernate.transaction.JDBCTransactionFactory");
		properties.put("hibernate.current_session_context_class", "thread");
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.connection.url", env.getProperty("jdbc.url"));
		properties.put("hibernate.connection.username", env.getProperty("jdbc.username"));
		properties.put("hibernate.connection.password", env.getProperty("jdbc.password"));
		properties.put("hibernate.connection.driver_class", env.getProperty("jdbc.driver"));
		properties.put("hibernate.connection.pool_size", 1);
		
		return new org.hibernate.cfg.Configuration()
	            .addProperties(properties)
	            .addAnnotatedClass(User.class)
	            .addAnnotatedClass(Post.class)
	            .buildSessionFactory(
                    new StandardServiceRegistryBuilder()
                        .applySettings(properties)
                        .build()
	            );
	}*/
	
    /*@Bean
    public HibernateTransactionManager transactionManager() {
    	
    	HibernateTransactionManager transactionManager = new HibernateTransactionManager();
    	
    	SessionFactory sessionFactory = sessionFactory().getConfiguration().buildSessionFactory();
    	
    	transactionManager.setDataSource(securityDataSource());
    	transactionManager.setSessionFactory(sessionFactory);
    	
    	return transactionManager;
    }*/
}
