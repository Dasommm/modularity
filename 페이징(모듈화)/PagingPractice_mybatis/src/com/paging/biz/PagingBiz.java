package com.paging.biz;

import java.util.List;

import com.paging.dto.BoardDto;
import com.paging.dto.PagingDto;

public interface PagingBiz {
	
	public List<BoardDto> selectList(PagingDto dto);
	
	public int totalPage(int column);

}
