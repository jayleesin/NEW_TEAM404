package org.tasteforming.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberTests {

	@Setter(onMethod_ = { @Autowired })
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = { @Autowired })
	private DataSource ds;

//	@Test
//	public void testInsertMember() {
//
//		String sql =
//
//				"insert into member(userid, userpw, username, address) values (?,?,?, ?)";
//
//		for (int i = 0; i < 300; i++) {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//
//			try {
//
//				con = ds.getConnection();
//				pstmt = con.prepareStatement(sql);
//
//				pstmt.setString(2, pwencoder.encode("pw" + i));
//
//				if (i < 200) {
//					pstmt.setString(1, "user0" + i);
//					pstmt.setString(3, "일반유저" + i);
//					pstmt.setString(4, "address" + i);
//				} else if (i < 250) {
//					pstmt.setString(1, "manager" + i);
//					pstmt.setString(3, "매니저" + i);
//					pstmt.setString(4, "address" + i);
//				} else {
//					pstmt.setString(1, "admin" + i);
//					pstmt.setString(3, "관리자" + 1);
//					pstmt.setString(4, "address" + i);
//				}
//
//				pstmt.executeUpdate();
//
//			} catch (Exception e) {
//
//				e.printStackTrace();
//
//			} finally {
//				if (pstmt != null) {
//					try {
//						pstmt.close();
//					} catch (Exception e) {
//					}
//				}
//				if (con != null) {
//					try {
//						con.close();
//					} catch (Exception e) {
//					}
//				}
//
//			}
//		} // end for
//	}

	@Test
	public void testInsertAuth() {

		String sql = "insert into auth (userid, auth) values (?,?)";

		for (int i = 0; i < 300; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				if (i < 200) {
					pstmt.setString(1, "user0" + i);
					pstmt.setString(2, "ROLE_USER");
				} else if (i < 250) {
					pstmt.setString(1, "manager" + i);
					pstmt.setString(2, "ROLE_MANAGER");
				} else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}

				pstmt.executeUpdate();

			} catch (Exception e) {

				e.printStackTrace();

			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
					}
				}
			}
		} // end for 
		
	}
}
