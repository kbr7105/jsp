package com.boram.domain;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {

    private Long bno;
    private String title;
    private String content;
    private String writer;
    private Date regidate;
    private Date updatedate;
    
	
}
