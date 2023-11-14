package com.boram.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class BoardMapperTest {

	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		List<BoardVO> list = mapper.getList();
		for(BoardVO vo : list) {
			log.info(vo);
		}
		
		//mapper.getList().forEach(board->log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO vo = BoardVO.builder().title("title55").content("content55").writer("writer55").build();
//		BoardVO vo = new BoardVO();
//		vo.setTitle("title44");
//		vo.setContent("content44");
//		vo.setWriter("writer44");
		mapper.insert(vo);
	}
	
	@Test
	public void testInsertBno() {
		BoardVO vo = BoardVO.builder().title("bno").content("bno").writer("bno").build();
		int result = mapper.insertSelectKey(vo);
		log.info("bno : "+result);
	}
	
	@Test
	public void testRead() {
		BoardVO vo = mapper.read(4L);
		log.info(vo);
	}
	
	@Test
	public void delteTest() {
		int result = mapper.delete(4L);
		log.info(result);
	}
	
	@Test
	public void updateTest() {
		BoardVO vo = BoardVO.builder().bno(3L).title("update").content("update").writer("update").build();
		int result = mapper.update(vo);
		log.info("result >>"+result);
	
	}
	
	@Test
	public void testGetListwithPaging() {
		Criteria cri = new Criteria();
		cri.setAmount(10);
		cri.setPageNum(3);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board->log.info(board));
	}
	
	@Test
	public void getCountTest() {
		Criteria cri = new Criteria();
		cri.setType("TCW");
		cri.setKeyword("테스트");
		log.info(mapper.getTotalCount(cri));
		
	}
	
	@Test
	public void testSearch() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("T", "테스트");
		map.put("C", "내용");
		map.put("W", "저자");
		Map<String, Map<String,String>> outer = new HashMap<String, Map<String, String>>();
		outer.put("map", map);
		List<BoardVO> list = mapper.serarchTest(outer);
		log.info(list);
	}
	
	@Test
	public void testSearchPaging() {
		Criteria cri = new Criteria();
		cri.setType("");
		cri.setKeyword("");
		/*
		 * cri.setType("TWC"); cri.setKeyword("테스트");
		 */
		/*
		 * List<BoardVO> list = mapper.getListWithPaging(cri); log.info(list);
		 */
		
		mapper.getListWithPaging(cri).forEach(list->log.info(list));
	}
	
}
