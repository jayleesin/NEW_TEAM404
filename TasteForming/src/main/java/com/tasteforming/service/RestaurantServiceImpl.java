package com.tasteforming.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.RestaurantVO;
import com.tasteforming.mapper.RestaurantMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class RestaurantServiceImpl implements RestaurantService {
   @Autowired
   private RestaurantMapper mapper;

   // RestaurantService 에서 호출받아 mapper과 상호작용 후 처리
   // 비지니스 로직 작성구간
   //RestaurantServiceImpl은 반환된 데이터를 RestaurantController로 반환합니다.
   @Override
   public List<RestaurantVO> getAllData() {
      return mapper.getAllData();
   }
   @Override
   public void likeCnt(RestaurantVO restaurantVO) {
	    mapper.likeCnt(restaurantVO);
   }


   @Override
   public void RestRegister(RestaurantVO restaurantVO) {
	  log.info("서비스인포 식당이름:"+restaurantVO.getRes_Name());
	  log.info("서비스인포 주소:"+restaurantVO.getAddress());
	  log.info("서비스인포 정보:"+restaurantVO.getInfo());
	  log.info("서비스인포 메뉴:"+restaurantVO.getMenu());
      mapper.insertRest(restaurantVO);
   }

//	public void customRegister(MemberVO member) {
//		member.setUserPw(pwEncoder.encode(member.getUserPw()));
//		log.info("User Sec PW" + member.getUserPw());
//		memberMapper.createMember(member);
//		memberMapper.createMemberAuth(member);
//	}

}