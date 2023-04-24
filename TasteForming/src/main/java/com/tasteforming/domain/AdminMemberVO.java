package com.tasteforming.domain;


import java.sql.Date;

import lombok.Data;

@Data
public class AdminMemberVO {
	private String userId;
	private String userName;
	private Date regDate;
	private Date updateDate;
	private String enabled;
	private String auth;
	private String address;
}
