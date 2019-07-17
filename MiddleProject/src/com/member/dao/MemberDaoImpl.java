package com.member.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;


import com.member.vo.MemberVo;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao  {//SqlInter

	static SqlSessionFactory factory;

	static {
		String resource = "com/member/conf/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<MemberVo> getAll() {
		SqlSession session = factory.openSession();
		List<MemberVo> all = null;
		try {
			all = session.selectList("memberMapper.view");
			System.out.println(all.size());

		} finally {
			session.close();
		}
		return all;
	}

	@Override
	public int getInsert(MemberVo memberVo) {
		// System.out.println(memberVo);
		SqlSession session = factory.openSession();
		int res = 0;
		try {
			res = session.insert("memberMapper.memberInsert", memberVo);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();

		} finally {
			session.close();
		}
		return res;
	}

	@Override
	   public int getDelete(String del_name) {
	      
	      
	      SqlSession session = factory.openSession();
	      int all = 0;
	      try {
	         all = session.delete("memberMapper.memberDelete", del_name);
	         if (all > 0) {
	            
	            session.commit();
	         }else {
	            
	         }
	      } catch (Exception e) {
	         session.rollback();
	         e.fillInStackTrace();

	      } finally {
	         session.close();
	      }
	      return all;
	   }

	@Override
	public int getUpdate(MemberVo memberVo) {
		System.out.println(memberVo+"ㅇ먱ㄹㄴㄴㄴㄴㄴㄴㄹㄹㄹㄹㄹㄹㄹ");
		SqlSession session = factory.openSession();
		int all = 0;
		try {
			System.out.println("update 직전ㄴ"+all);
			all = session.update("memberMapper.memberUpdate", memberVo);
			System.out.println("update 완료"+all);
			if (all > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.fillInStackTrace();
		} finally {
			session.close();
		}
		return all;
	}
	
	@Override
	public MemberVo getFind(String id) {
		SqlSession session = factory.openSession();
		
		MemberVo all = null;
		try {
			all = session.selectOne("memberMapper.memberFind", id);
		} finally {
			session.close();
		}
		
		return all;
	}
	
	@Override
	public MemberVo getLogin(MemberVo memberVo) {
		SqlSession session = factory.openSession();
		   MemberVo all = null;
		   try {
			   all=session.selectOne("memberMapper.memberLogin", memberVo);
		   }catch(Exception e) {
			   System.out.println("로그인 DAO 실패");
			   e.printStackTrace();
		   }finally {
			   session.close();
		   }
		   return all;
		}
	
	@Override
	public MemberVo getLogout(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo getPwcheck(MemberVo memberVo) {
		SqlSession session = factory.openSession();
		   MemberVo all = null;
		   try {
			   all=session.selectOne("memberMapper.memberPwcheck", memberVo);
			   
		   }catch(Exception e) {
			   System.out.println("비번찾기 실패");
			   e.printStackTrace();
		   }finally {
			   session.close();
		   }
		   return all;
	}
	
	@Override
	public MemberVo getIdcheck(MemberVo memberVo) {
		SqlSession session = factory.openSession();
		   MemberVo all = null;
		   try {
			   all=session.selectOne("memberMapper.memberIdcheck", memberVo);
			   
		   }catch(Exception e) {
			   System.out.println("ID찾기 실패");
			   e.printStackTrace();
		   }finally {
			   session.close();
		   }
		   return all;
	}
}
