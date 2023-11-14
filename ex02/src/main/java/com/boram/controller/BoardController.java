package com.boram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boram.domain.BoardVO;
import com.boram.domain.Criteria;
import com.boram.domain.PageDTO;
import com.boram.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
//@AllArgsConstructor
@RequiredArgsConstructor
public class BoardController {

	private final BoardService boardService;
	
	@GetMapping("/list")
	public void getList(Criteria cri, Model model) {
		log.info("list...");
//		cri.setPageNum(2);
//		cri.setAmount(10);
		model.addAttribute("list", boardService.getListWithPaging(cri));
		model.addAttribute("pageMaker",new PageDTO(cri,boardService.getTotal(cri)));
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("register..."+vo);
		boardService.register(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list";
	}
	
	//@ModelAttribute 로 데이터를 view 단에 뿌려줌(뒤로가기 시 처음이 아니라 그 전 페이지로 돌아가기 위함)
	//해당 페이지에도 cri와 관련된 데이터를 hidden으로 가지고 다음 페이지에 form 으로 전송해줌
	@GetMapping({"/get", "/modify"})
	public void get(Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get or modify..."+bno);
		model.addAttribute("board", boardService.get(bno));
	}
	

	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		log.info("remove..."+bno);
		if(boardService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
	}
	
	
	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr,  @ModelAttribute("cri")Criteria cri) {
		log.info("modify..."+vo);
		if(boardService.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
	}
	
	
}
