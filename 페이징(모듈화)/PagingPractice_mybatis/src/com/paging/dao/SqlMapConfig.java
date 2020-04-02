package com.paging.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		// 1. mybatis 정보가 들어있는 config.xml 연결
		String resource = "com/paging/db/config.xml";
		
		try {
			// 2. reader로 resource경로에 있는 config.xml 읽어오기
			Reader reader = Resources.getResourceAsReader(resource);
			
			// 3. SqlSessionFactoryBuilder를 사용해 sqlSessionfactory에 reader에 담긴 정보로 build하기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
			// 4. reader 종료
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
	}
	
	

}
