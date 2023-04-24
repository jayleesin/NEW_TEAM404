package org.tasteforming.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.tasteforming.domain.AdminMemberVO;
import com.tasteforming.mapper.AdminMapper;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src//main//webapp//WEB-INF//spring//root-context.xml")
@Log4j
public class AdminMapperTests {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;

	@Test
	public void testGetList() {
		AdminMemberVO member = new AdminMemberVO();
		member.setUserId("user064");
		
		mapper.deleteUserAuth(member);
		log.info(member);
	}
}