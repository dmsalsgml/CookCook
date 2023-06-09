package cc.spring.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cc.spring.dto.ShopDTO;
import cc.spring.services.ShopService;

@Controller
@RequestMapping("/shop/")
public class ShopController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private HttpSession session;
	
	// 공구샵 등록 폼으로 이동
	@RequestMapping("toShopRegister")
	public String toShopRegister() {
		return "/shop/shopRegister";
	}
	
	// 공구샵 신청 폼으로 이동
	@RequestMapping("toShopApply")
	public String toShopApply(int code, Model model) {
		ShopDTO shopDTO = shopService.selectShopInfo(code);
		model.addAttribute("shopDTO", shopDTO);
		return "/shop/shopApply";
	}

	// 공구샵 등록시 DB에 insert
	@RequestMapping("insertShop")
	public String insertShop(ShopDTO dto, MultipartFile[] files) throws Exception {

		// realPath - 폴더가 없다면 만들기
		String realPath = session.getServletContext().getRealPath("upload");
		shopService.insertShop(dto, files, realPath);

		return "redirect:/";
	}

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
