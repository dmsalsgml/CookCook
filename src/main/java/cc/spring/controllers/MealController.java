package cc.spring.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.dto.ChatDTO;
import cc.spring.services.MealService;


@Controller
@RequestMapping("/meal/")
public class MealController {
	
	@Autowired
	private MealService mService;
	
	@RequestMapping("list")
	public String list() {
		return "meal/list";
	}
	
	@RequestMapping("basket")
	public String cart() {
		return "meal/basket";
	}
	
	@ResponseBody
	@RequestMapping(value="aiMeal",  produces="text/plain;charset=utf-8")
	public Map<String, ChatDTO>aiMeal(String sendMsg) throws Exception {
		Map<String, ChatDTO> result = mService.makeMeal(sendMsg);
		return result;
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}


}
