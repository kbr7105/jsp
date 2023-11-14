package com.boram.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.boram.domain.BoardVO;
import com.boram.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceImplTest {

	@Autowired
	private BoardService service;
	
	@Test
	public void testRegister() {
		BoardVO vo = BoardVO.builder().title("test").content("content").writer("writer").build();
		service.register(vo);
	}
	
	@Test
	public void testGetList() {
		//service.getList().forEach(board->log.info(board));
		Criteria cri = new Criteria();
		List<BoardVO>list = service.getListWithPaging(cri);
		for(BoardVO board : list) {
			log.info(board);
		}
	}
	
	@Test
	public void getReadTest() {
		BoardVO vo = service.get(1L);
		log.info(vo);
	}
	
	@Test
	public void updateTest() {
		BoardVO vo = BoardVO.builder().bno(1L).title("test수정").content("test 수정").writer("test수정").build();
		boolean result = service.modify(vo);
		log.info(result);
	}
	
	@Test
	public void deleteTest() {
		boolean result = service.remove(5L);
		log.info(result);
	}
}
