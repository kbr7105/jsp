package com.boram.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.boram.domain.Criteria;
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
	
	
	@Test
	public void testCreate2() {
		IntStream.range(1, 10).forEach(i->{ReplyVO vo =  
				ReplyVO.builder()
					.bno(1048580L)
					.reply("댓글테스트"+i)
					.replyer("댓글작성자"+i).build();
				mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(1L));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(2L));
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = ReplyVO.builder().rno(1L).reply("update").build();
		log.info(mapper.update(vo));
	}
	
	@Test
	public void testGetListWithPaging() {
		mapper.getListWithPaging(new Criteria(2,2), 1048580L)
			.forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testGetCount() {
		log.info(mapper.getCountByBno(1048580L));
	}

}
