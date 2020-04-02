package summernoteBiz;

import summernoteDao.DaoImpl;
import summernoteDao.SnDao;
import summernoteDto.SnDto;

public class BizImpl implements SnBiz {

	SnDao dao = new DaoImpl();
	
	@Override
	public int insertArticle(SnDto dto) {
		return dao.insertArticle(dto);
	}

	@Override
	public int insertImg(SnDto fileDto) {
		// TODO Auto-generated method stub
		return dao.insertImg(fileDto);
	}

	
}
