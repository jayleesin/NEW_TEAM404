package com.tasteforming.domain;
// 장혜림
import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

  private Long board_no;
  private String title;
  private String content;
  private Date regDate;
  private Date updateDate;
  private String userId;
}
