package com.boram.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boram.domain.SampleVO;
import com.boram.domain.Ticket;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@GetMapping(value="/getText", produces = "text/plain; charset=utf-8")
	public String getText() {
		log.info("MINE TYPE >>" + MediaType.TEXT_PLAIN_VALUE);
		return "안녕하세요.";
	}
	
	
	@GetMapping(value = "/getSample", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public SampleVO getSample() {
		return new SampleVO(112, "스타2", "로드2");
	}
	
	@GetMapping("/getSample2")
	public SampleVO getSample2() {
		return new SampleVO(113, "라쿤", "라쿤2");
	}
	
	@GetMapping("/getList")
	public List<SampleVO> getList(){
		return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i+" first", i+" last")).collect(Collectors.toList());
	}
	
	@GetMapping("/getList2")
	public List<SampleVO> getList2(){
		List<SampleVO> list = new ArrayList<SampleVO>();
		for(int i = 1; i<=10; i++) {
			list.add(new SampleVO(i, i+" first", i+" last"));
		}
		
		return list;
		//return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i+" first", i+" last")).collect(Collectors.toList());
	}
	
	@GetMapping("/getMap")
	public Map<String, SampleVO> getMap(){
		Map<String, SampleVO> map = new HashMap<String, SampleVO>();
		map.put("first", new SampleVO(111, "그루트", "주니어"));
		return map;
	}
	
	//parmas 생략가능-> params 를 작성할 경우 필수로 params 를 전달해야함
	@GetMapping(value = "/check", params={"height","weight"})
	public ResponseEntity<SampleVO> check(Double height, Double weight){
		SampleVO vo = new SampleVO(0, ""+height, ""+weight);
		ResponseEntity<SampleVO> result = null;
		
		//값 자체는 모두 전달되지만 올바른 값인지 아닌지를 판별하기 위해 상태값까지 같이 전달
		if(height <150) {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		}else {
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}
		return result;
	}
	
	//파라미터 값을 data로 받아옴
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid")String pid) {
		return new String[] {"category : " + cat, "productid : "+pid};
	}
	
	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		log.info("ticket>>"+ticket); 
		//{"tno":10, "owner":"aaa", "grade":"B"}
		return ticket;
	}
	
	@PostMapping("/ticket2")
	public Ticket convert2(Ticket ticket) {
		log.info("ticket>>"+ticket); 
		//{"tno":10, "owner":"aaa", "grade":"B"} -> 값이 안들어감 => requestBody 필수
		return ticket;
	}
}
