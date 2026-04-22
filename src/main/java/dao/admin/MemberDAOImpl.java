package dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.admin.Member;
import util.MybatisSqlSessionFactory;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public List<Member> selectAllGym() throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		List<Member> list = null;
		try {
			list = sqlSession.selectList("mapper.admin.member.selectAllGym");
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			sqlSession.close();
		}
		return list;
	}

	@Override
	public List<Member> selectAllTrainer() throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		List<Member> list = null;
		try {
			list = sqlSession.selectList("mapper.admin.member.selectAllTrainer");
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			sqlSession.close();
		}
		return list;
	}

	@Override
	public List<Member> selectAllClient() throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		List<Member> list = null;
		try {
			list = sqlSession.selectList("mapper.admin.member.selectAllClient");
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			sqlSession.close();
		}
		return list;
	}


	@Override
	public Integer selectGymCnt() throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		Integer gymCnt = 0;
		try {
			gymCnt = sqlSession.selectOne("mapper.admin.member.selectGymCnt");
		} catch(Exception e){
			e.printStackTrace();
			throw e;
		} finally {
			sqlSession.close();
		}
		return gymCnt;
	}

	@Override
	public Integer selectTrainerCnt() throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		Integer trainerCnt = 0;
		try {
			trainerCnt = sqlSession.selectOne("mapper.admin.member.selectTrainerCnt");
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			sqlSession.close();
		}
		return trainerCnt;
	}

	@Override
	public Integer selectClientCnt() throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		Integer clientCnt = 0;
		try {
			clientCnt = sqlSession.selectOne("mapper.admin.member.selectClientCnt");
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			sqlSession.close();
		}
		return clientCnt;
	}

	@Override
	public List<Member> selectGymList(Map<String, Integer> pagingMap) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		List<Member> gymList = null;
		try {
			gymList = sqlSession.selectList("mapper.admin.member.selectGymList", pagingMap);
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			sqlSession.close();
		}
		return gymList;
	}

	@Override
	public List<Member> selectTrainerList(Map<String, Integer> pagingMap) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		List<Member> trainerList = null;
		try {
			trainerList = sqlSession.selectList("mapper.admin.member.selectTrainerList", pagingMap);
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			sqlSession.close();
		}
		return trainerList;
	}

	@Override
	public List<Member> selectClientList(Map<String, Integer> pagingMap) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		List<Member> clientList = null;
		try {
			clientList = sqlSession.selectList("mapper.admin.member.selectClientList", pagingMap);
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			sqlSession.close();
		}
		return clientList;
	}
}