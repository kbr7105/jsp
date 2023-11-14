package com.boram.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReplyVO {

	private Long rno, bno;
	private String reply, replyer;
	private Date replyDate, updateDate;
	
	
}
