package com.paging.biz;

import java.util.List;

import com.paging.dao.PagingDao;
import com.paging.dao.PagingDaoImpl;
import com.paging.dto.BoardDto;
import com.paging.dto.PagingDto;

public class PagingBizImpl implements PagingBiz {
	
	private PagingDao dao = new PagingDaoImpl();

	@Override
	public List<BoardDto> selectList(PagingDto dto) {
		int currentpage = dto.getCurrentpage();
		int column = dto.getColumn();
		
		int startseq = column * (currentpage - 1) + 1;
		int endseq = column * currentpage;
		
		return dao.selectList(startseq, endseq);
	}

	@Override
	public int totalPage(int column) {
		int totalpage = (int)Math.ceil((double)dao.totalpage()/column);
		return totalpage;
	}

}
