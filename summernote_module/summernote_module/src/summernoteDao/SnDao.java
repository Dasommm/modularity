package summernoteDao;

import summernoteDto.SnDto;

public interface SnDao {

	public int insertArticle(SnDto dto);

	public int insertImg(SnDto fileDto);

}
