package com.boram.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {    

	private Long rno, bno;
	private String reply, replyer;
	private Date replyDate, updateDate;
	
	
}
