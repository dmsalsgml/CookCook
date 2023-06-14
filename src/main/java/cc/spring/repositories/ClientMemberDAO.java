package cc.spring.repositories;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.ClientMemberDTO;
@Repository
public class ClientMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public boolean login(ClientMemberDTO dto) {
		boolean result = mybatis.selectOne("Client.login",dto);
		System.out.println("DAO 리턴결과:"+result);
		return result;
	}
//	폰 번호 넘겨서 아이디 찾아오는거에요
	public String getIdByPhone(String phone) {
		System.out.println("비번바꾸는 DAO");
		return mybatis.selectOne("Client.getIdByPhone",phone);
	}
	
	public boolean isClientMember(String id) {
		return mybatis.selectOne("Client.isMember", id);
	}
	
	public boolean phoneCheck(String phone) {
		return mybatis.selectOne("Client.phoneCheck",phone);
	}
	
	public int insertClient(ClientMemberDTO dto) {
		return mybatis.insert("Client.insert",dto);
	}
	
	public int updatePw(ClientMemberDTO dto) {
		return mybatis.update("Client.updatePw", dto);
	}

}
