package com.proj.my.map.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.proj.my.member.service.MemberService;
import com.proj.my.member.vo.MemberVO;

@Controller
public class mapController {
	

	// 회원가입 페이지로 이동
	@RequestMapping("/Michelin")
	public String registView() {
		return "map/Michelin";
	}
	/*registView() 메소드: GET 요청에 대한 회원 가입 페이지를 반환합니다. */
	
	

	
}