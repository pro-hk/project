package com.simmons.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan("com.simmons.model")
@MapperScan("com.simmons.mybatis")
public class RootAppContext {

	// Hikari : Database와 Connection Pool 연결
	@Bean
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		hikariConfig.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		hikariConfig.setUsername("simmons");
		hikariConfig.setPassword("1234");
		
		HikariDataSource dataSource = new HikariDataSource(hikariConfig);
		
		return dataSource;
	}

	// mybatis 매핑(SQL 매핑)
	@Bean
	public SqlSessionFactory sqlSesionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		PathMatchingResourcePatternResolver pathResolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setConfigLocation(pathResolver.getResource("classpath:com/simmons/mybatis/config.xml"));
		sqlSessionFactoryBean.setMapperLocations(pathResolver.getResources("classpath:com/simmons/mybatis/*Mapper.xml"));
		
		return (SqlSessionFactory)sqlSessionFactoryBean.getObject();
	}
	
	// 트랜잭션 : 여러가지 일을 한번에 처리(송금 : 출금 - 입금)
	@Bean
	public PlatformTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
}
