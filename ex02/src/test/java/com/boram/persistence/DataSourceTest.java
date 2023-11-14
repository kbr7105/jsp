package com.boram.persistence;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTest {
	
	@Autowired
	private DataSource datasource;
	
	
	@Test
	public void testConnection() {
		Connection con = null;
		try {
			con = datasource.getConnection();
			log.info("con :"+ con);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) {
					con.close();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	} 

}
