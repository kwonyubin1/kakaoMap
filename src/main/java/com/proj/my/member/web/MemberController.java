package com.proj.my.member.web;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.proj.my.member.service.MemberService;
import com.proj.my.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
    private JavaMailSender mailSender;

	// 회원가입 페이지로 이동
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	/*registView() 메소드: GET 요청에 대한 회원 가입 페이지를 반환합니다. */
	
	
	/*
	 * @ResponseBody
	 * 
	 * @GetMapping("/checkExistingId") public ResponseEntity<?>
	 * checkExistingId(@RequestParam("memId") String memId) { boolean existingId =
	 * memberService.checkExistingId(memId); Map<String, Object> map = new
	 * HashMap<String, Object>();
	 * 
	 * if (existingId) { // return new ResponseEntity<>("이미 존재하는 아이디입니다.",
	 * HttpStatus.BAD_REQUEST); map.put("msg", "이미 존재하는 아이디입니다."); } else { //
	 * return new ResponseEntity<>("아이디 사용 가능", HttpStatus.OK); map.put("msg",
	 * "아이디 사용 가능."); } return new ResponseEntity<Map<String, Object>>(map,
	 * HttpStatus.OK); }
	 */
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memId) throws Exception{
		System.out.println("memberIdChk() 진입");

		int result = memberService.idCheck(memId);
		
		System.out.println("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
	} // memberIdChkPOST() 종료	
	
	
	// 회원가입 처리를 담당하는 메서드입니다.
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request, MemberVO member, RedirectAttributes re) {
	    // 사용자의 비밀번호를 암호화하여 저장
	    member.setMemPw(passwordEncoder.encode(request.getParameter("memPw")));
	    // 회원가입 정보를 콘솔에 출력합니다. (테스트용)
	    System.out.println(member);
	    try {
	        // 회원가입 서비스를 호출하여 회원가입을 처리합니다.
	        memberService.registMember(member);
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 회원가입 처리 중에 예외가 발생하면 에러 페이지로 이동합니다.
	        return "errorView";
	    }
	    // 회원가입 성공 시 메시지를 포함하여 리다이렉트합니다.
	    re.addFlashAttribute("msg", "회원가입이 정상적으로 처리 되었습니다.");
	    return "redirect:/";
	}
	
	/*registDo() 메소드:
	     회원 가입을 처리합니다.
             입력 받은 비밀번호를 BCrypt 알고리즘을 사용하여 암호화합니다.
	     암호화된 비밀번호를 DB에 저장하고, 성공적으로 처리된 경우 메인 페이지로 리다이렉트합니다. */

	
	// 로그인 페이지로 이동
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest req, Model model) {
		// 이전 페이지 URL을 가져와서 모델에 추가하여 로그인 후 이동할 페이지를 저장
		String reqURL = req.getHeader("Referer");
		model.addAttribute("fromURL", reqURL);
		return "member/loginView";
	}	
	 /* loginView() 메소드:
		GET 요청에 대한 로그인 페이지를 반환합니다.
		이전 페이지 URL을 가져와서 로그인 후 이동할 페이지를 저장합니다.*/
	

	
	// 로그인 처리
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo, HttpSession session, boolean remember, String fromURL, RedirectAttributes re, HttpServletResponse resp) {
		MemberVO login = memberService.loginMember(vo);
		if(login == null) {
			re.addFlashAttribute("msg", "아이디/비밀번호를 확인해 주세요.");
			return "redirect:/loginView";
		}
		// 입력된 비밀번호와 DB에 저장된 암호화된 비밀번호를 비교
		boolean match = passwordEncoder.matches(vo.getMemPw(), login.getMemPw());
		if(!match) {
			re.addFlashAttribute("msg", "비밀번호를 확인해 주세요.");
			return "redirect:/loginView";
		}
		
		// 로그인 성공 시 세션에 사용자 정보 저장
		session.setAttribute("login", login);
		
		// 아이디 기억하기가 선택되었을 때
		if(remember) {
			Cookie cookie = new Cookie("rememberId", vo.getMemId());
			resp.addCookie(cookie);
		} else {
			// 아이디 기억하기가 선택되지 않았을 때 기존 쿠키 삭제
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			resp.addCookie(cookie);
		}
		
		 // 로그인 성공 메시지를 전달
	    re.addFlashAttribute("msg", "로그인에 성공하셨습니다.");

		return "redirect:" + fromURL;
		
		
	}
	
	
	
	
	
	/*loginDo() 메소드:
		로그인을 처리합니다.
		입력한 아이디로 회원을 찾고, 비밀번호가 일치하는지 확인합니다.
		로그인 성공 시 세션에 로그인 정보를 저장하고, 아이디 기억하기 옵션이 선택되었다면 쿠키에 아이*/
	
	
	// 로그아웃 처리
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session, RedirectAttributes re) {
		// 세션 종료
		session.invalidate();
		re.addFlashAttribute("msg", "로그아웃 되셨습니다.");
		return "redirect:/";
	}
	/*logoutDo() 메소드:
		로그아웃을 처리합니다.
		세션을 종료하고 메인 페이지로 리다이렉트합니다.*/
	
	
	// 마이페이지로 이동
	@RequestMapping("/mypageView")
	public String mypageView(HttpSession session, Model model) {
		// 로그인 여부 확인 후 마이페이지 이동
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		return "member/mypageView";
	}	
	/*mypageView() 메소드:
		마이페이지로 이동합니다.
		세션에 로그인 정보가 없는 경우 로그인 페이지로 리다이렉트합니다.*/
	
	
	
	// "/updateDo" 경로로 요청이 들어오면 실행되는 메소드입니다.
	@RequestMapping("/updateDo")
	public String updateMember(MemberVO vo, HttpSession session, RedirectAttributes re) {
	   try {
	       // 현재 로그인한 회원 정보를 세션에서 가져옵니다.
	       MemberVO login = (MemberVO) session.getAttribute("login");
	       
	       // MemberService의 updateMember 메소드를 호출하여 회원 정보를 업데이트합니다.
	       memberService.updateMember(vo);
	       
	       // 업데이트된 회원 이름을 세션에 저장합니다.
	       login.setMemNm(vo.getMemNm());
	       session.setAttribute("login", login);
	       
	       // 수정이 성공했음을 나타내는 메시지를 Flash 속성에 추가합니다.
	       re.addFlashAttribute("msg", "수정되었습니다.");
	   } catch (Exception e) {
	       // 수정이 실패했음을 나타내는 메시지를 Flash 속성에 추가합니다.
	       re.addFlashAttribute("msg", "수정실패 ! 다시 시도해 주세요.");
	   }
	   // 마이페이지로 리다이렉트합니다.
	   return "redirect:/mypageView";
	}
	/*해당 메소드는 "/updateDo" 경로로 요청이 들어오면 실행되며, 
	 * 현재 로그인한 회원의 정보를 가져와서 입력된 회원 정보를 업데이트합니다. 
	 * 업데이트가 성공하면 수정이 완료되었다는 메시지를 Flash 속성에 추가하고, 
	 * 실패하면 실패 메시지를 추가합니다. 마지막으로 마이페이지로 리다이렉트합니다.*/
	
	

    /* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        System.out.println("이메일 데이터 전송 확인");
        System.out.println("인증번호 : " + email);
        

        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호" + checkNum);  

        /* 이메일 보내기 */
        String setFrom = "luyace77@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        

		
		 try {
		 
		 MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		 helper = new MimeMessageHelper(message, true, "utf-8");
		 helper.setFrom(setFrom); helper.setTo(toMail); helper.setSubject(title);
		 helper.setText(content,true); mailSender.send(message);
		 
		 }catch(Exception e) { e.printStackTrace(); }
		 
        String num = Integer.toString(checkNum);
 
        return num;
        
    }
	
	
	
	@PostMapping("/files/upload")
	public ResponseEntity<?> uploadFiles(
			@RequestParam("uploadImage") MultipartFile uploadImage
			,HttpSession session) throws Exception {
		//웹 접근경로
		String webPath = "/resources/mypage/";
		//서버 저장 폴더
		String folderPath = session.getServletContext().getRealPath(webPath);
		MemberVO login = (MemberVO) session.getAttribute("login");
		String imgPath=
				memberService.uploadProfile(login, folderPath, webPath, uploadImage);
		Map<String, Object> map = new HashMap<String, Object>();
		login.setProfileImg(imgPath);
		session.setAttribute("login", login);
		map.put("message","success");
		map.put("imgPath", imgPath); //화면에서 사용할 경로전달
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
	}
	
	
}