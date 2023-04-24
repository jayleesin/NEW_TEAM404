package com.tasteforming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tasteforming.domain.MemberVO;
import com.tasteforming.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CommonServiceImpl implements CommonService {

	private PasswordEncoder pwEncoder;
	private MemberMapper memberMapper;
	
	@Transactional
	@Override
	public void customRegister(MemberVO member) {
		member.setUserPw(pwEncoder.encode(member.getUserPw()));
		log.info("User Sec PW" + member.getUserPw());
		memberMapper.createMember(member);
		memberMapper.createMemberAuth(member);
	}

	/*
	 * @Override public int overlappedID(MemberVO memberVO) throws Exception{ int
	 * result = memberMapper.overlappedID(memberVO); return result; }
	 * 
	 * @Override public int setInsert(MemberVO member) { int result =
	 * memberMapper.setInsert(member); return result; };
	 */
}