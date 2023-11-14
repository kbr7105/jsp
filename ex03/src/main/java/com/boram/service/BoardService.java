package com.boram.service;

import java.util.List;

import com.boram.domain.BoardVO;
import com.boram.domain.Criteria;

public interface BoardService {
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	public BoardVO get(Long bno);
	public void register(BoardVO board);
	public boolean modify(BoardVO voard);
	public boolean remove(Long bno);
	public int getTotal(Criteria cri);

}
