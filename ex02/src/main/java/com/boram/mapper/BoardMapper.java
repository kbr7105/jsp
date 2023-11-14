package com.boram.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.boram.domain.BoardVO;
import com.boram.domain.Criteria;

@Component
public interface BoardMapper {
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	//페이징
	public List<BoardVO> getListWithPaging(Criteria criteria);
	
	public void insert(BoardVO vo);
	public int insertSelectKey(BoardVO vo);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int update(BoardVO vo);
	
	//total
	public int getTotalCount(Criteria cri);
	
	//test
	public List<BoardVO> serarchTest(Map<String, Map<String,String>> map);
	
}
