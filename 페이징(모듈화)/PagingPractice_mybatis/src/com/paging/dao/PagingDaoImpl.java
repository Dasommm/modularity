package com.paging.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.paging.dto.BoardDto;
import com.paging.dto.PagingDto;

public class PagingDaoImpl extends SqlMapConfig implements PagingDao {
	
	private String namespace = "mypage.";

	@Override
	public List<BoardDto> selectList(int startseq, int endseq) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		PagingDto dto = new PagingDto();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			dto.setStartseq(startseq);
			dto.setEndseq(endseq);
			list = session.selectList(namespace + "selectList",dto);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	@Override
	public int totalpage() {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace + "totalpage");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

}
