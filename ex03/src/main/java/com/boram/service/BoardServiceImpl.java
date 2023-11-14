package com.boram.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.boram.domain.BoardVO;
import com.boram.domain.Criteria;
import com.boram.mapper.BoardMapper;

import lombok.Builder;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor //
//@Builder
@Log4j
public class BoardServiceImpl implements BoardService{

	//final 이 붙어있으면 autowired 필요 없음
	private final BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		log.info("get list..."+cri);
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("read..."+bno);
		return boardMapper.read(bno);
	}

	@Override
	public void register(BoardVO board) {
		log.info("register...."+board);
		boardMapper.insertSelectKey(board);
		
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify...."+board);
		int result = boardMapper.update(board);
		
		//return boardMapper.update(board) == 1;
		return boardMapper.update(board) == 1 ? true : false;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove...."+bno);
		return boardMapper.delete(bno) == 1? true : false;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("total...."+cri);
		return boardMapper.getTotalCount(cri);
	}

}
