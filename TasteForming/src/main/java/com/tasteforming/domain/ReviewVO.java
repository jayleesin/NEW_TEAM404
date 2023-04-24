package com.tasteforming.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private long resview_No;
	private String content;
	private String userId;
	private Date regDate;
	private Date updateDate;
	private long res_No;

}
