package summernoteDao;

import org.apache.ibatis.session.SqlSession;

import summernoteDto.SnDto;

public class DaoImpl extends SqlConfigMap implements SnDao {

	String namespace = "summernote.";
	
	@Override
	public int insertArticle(SnDto dto) {	//text insert
		
		SqlSession session = null;
		int arti = 0;		
		System.out.println(dto.getContent());
		System.out.println(dto.getTitle());
		try {
			session = getSqlSessionFactory().openSession();
			arti = session.insert(namespace+"artiInput",dto);
			
			if(arti>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return arti;
	}

	@Override
	public int insertImg(SnDto fileDto) {
		SqlSession session = null;
		int imgRes = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			imgRes = session.insert(namespace+"imgInput",fileDto);
			
			if(imgRes>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return fileDto.getImgseq();
	}



}
