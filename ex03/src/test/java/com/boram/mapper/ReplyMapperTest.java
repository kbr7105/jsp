package com.boram.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.boram.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {

	@Autowired
	private ReplyMapper mapper;
	

	
	private Long[] bnoArr = {
			1048580L, 1048579L, 1048578L, 1048577L, 1048575L	
	};
	
	@Test
	public void testMapper() {
		log.info(">>>"+mapper);;
	}
	
	@Test
	public void testCreate() {
		IntStream.range(1, 10).forEach(i->{ReplyVO vo =  
				ReplyVO.builder()
					.bno(bnoArr[i%5])
					.reply("댓글테스트"+i)
					.replyer("댓글작성자"+i).build();
				mapper.insert(vo);
		});
	}

}
