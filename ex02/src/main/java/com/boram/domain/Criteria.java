package com.boram.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

		private int pageNum; //page num
		private int amount; //page 당 데이터 개수
		
		private String type; // T, C, W title content writer
		private String keyword; //검색 내용
		
		public Criteria() {
			this(1,10);
		}
		
		public Criteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}
		
		public String[] getTypeArr() {
			return type == null? new String[] {} : type.split("");
		}
		
}
