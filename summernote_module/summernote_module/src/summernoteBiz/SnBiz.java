package summernoteBiz;

import summernoteDto.SnDto;

public interface SnBiz {
	
	public int insertArticle(SnDto dto);

	public int insertImg(SnDto fileDto);


}
