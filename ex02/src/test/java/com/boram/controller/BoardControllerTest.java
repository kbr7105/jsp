package com.boram.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
@WebAppConfiguration //추가설정부분1
public class BoardControllerTest {
	
	//컨트롤러 테스트 -> 컨트롤러 설정부분을 추가(root-context+servlet-context)
	//webAppconfiguration
	//webApplicationContext
	//mockup
	@Autowired
	private WebApplicationContext ctx; //2
	
	//@Autowired
	private MockMvc mockMvc; //3
	
	
	@Before //4
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}

	@Test
	public void testRegister() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title","테스트 글")
				.param("content", "내용")
				.param("writer", "저자"))
				.andReturn()
				.getModelAndView()
				.getViewName()
				);
	}
	
	@Test
	public void getTest() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno","1"))
				.andReturn()
				.getModelAndView()
				.getViewName()
				);
	}
	
	@Test
	public void modifyTest() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "2")
				.param("title", "test2222")
				.param("content", "tttttt")
				.param("writer", "wwwww")
				).andReturn()
				.getModelAndView()
				.getViewName());
	}
	
	@Test
	public void removeTest() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "4"))
				.andReturn()
				.getModelAndView()
				.getViewName()
				);
	}
}
