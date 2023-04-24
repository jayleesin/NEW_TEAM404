package com.tasteforming.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private long rno;
	private long bno;
	
	private String reply;
	private String replyer;
	private Date updateDate;
	private Date replyDate;
	private int likeCount; // 좋아요 카운트 필드 추가
}
