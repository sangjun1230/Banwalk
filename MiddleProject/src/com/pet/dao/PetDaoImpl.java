package com.pet.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import com.pet.vo.PetVo;
import com.member.vo.MemberVo;



@Repository("petDao")
public class PetDaoImpl implements PetDao {
	static SqlSessionFactory factory;
	static {
		String resource = "com/member/conf/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(inputStream);
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<PetVo> getPetAll(String member_id) {
		
		SqlSession session = factory.openSession();
		List<PetVo> all = null;
		try {
			all = session.selectList("petMapper.PetView", member_id);
		}finally {
			session.close();
		}
		return all;
	}

	@Override
	public int getPetInsert(PetVo petVo) {
		SqlSession session = factory.openSession();
		int all = 0;
		try {
			all = session.insert("petMapper.PetInsert",petVo);
			
			if (all > 0) {
				session.commit();
			}
		}catch (Exception e) {
			e.fillInStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return all;
	}


	@Override
	public int getPetDelete(PetVo petVo) {
		SqlSession session = factory.openSession();
		int all = 0;
		try {
			all = session.delete("petMapper.PetDelete", petVo);
			
			if (all>0) {
				session.commit();
			}
		}catch (Exception e) {
				session.rollback();
				e.fillInStackTrace();
		}finally {
			session.close();
		}
		return all;
	}

	@Override
	public int getPetUpdate(PetVo petVo) {
		SqlSession session = factory.openSession();
		int all = 0;
		try {
			all = session.update("petMapper.PetUpdate",petVo);
			if(all > 0) {
				session.commit();
			}
		}catch(Exception e) {
			session.rollback();
		}finally {
			session.close();
		}
		return all;
	}

	@Override
	public PetVo getPetFind(PetVo petVo) {
		SqlSession session = factory.openSession();
		
		PetVo all = null;
		try {
			all = session.selectOne("petMapper.PetFind", petVo);
		} finally {
			session.close();
		}

		return all;
	}
}
