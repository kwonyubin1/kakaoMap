package com.proj.my.free.web;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.my.commons.service.CodeService;
import com.proj.my.commons.vo.CodeVO;
import com.proj.my.free.service.FreeService;
import com.proj.my.free.vo.FreeBoardVO;
import com.proj.my.free.vo.FreeSearchVO;
import com.proj.my.member.vo.MemberVO;

@Controller
public class FreeBoardController {
    
    @Autowired
    FreeService freeService; // FreeService 객체를 주입받음
    
    @Autowired
    CodeService codeService; // CodeService 객체를 주입받음
    
    // 모델에 코드 목록을 추가하는 메서드
    @ModelAttribute("comList")
    public List<CodeVO> getCodeList(){
        // 코드 서비스를 통해 코드 목록을 가져와서 반환
        return codeService.getCodeList("BC00");
    }
    
    
    // 게시글 리스트를 조회하는 메서드
    @RequestMapping("/freeList")
    public String freeList(Model model, @ModelAttribute("searchVO") FreeSearchVO searchVO) {
        // 검색 조건에 맞는 게시글 목록을 FreeService를 통해 가져옴
        List<FreeBoardVO> freeList = freeService.getBoardList(searchVO);
        // 모델에 게시글 목록을 추가하여 View로 전달
        model.addAttribute("freeList", freeList);
        // 게시글 목록을 보여줄 View 이름 반환
        return "free/freeList";
    }
    
    
    // 게시글 상세 내용을 조회하는 메서드
    @RequestMapping("/freeView")
    public String freeView(Model model, int boNo) {
        try {
            // 주어진 게시글 번호(boNo)에 해당하는 게시글을 FreeService를 통해 가져옴
            FreeBoardVO freeBoard = freeService.getBoard(boNo);
            // 모델에 가져온 게시글 정보를 추가하여 View로 전달
            model.addAttribute("freeBoard", freeBoard);
        } catch (Exception e) {
            // 게시글을 가져오는 중에 예외가 발생한 경우, 예외를 출력하고 게시글 리스트 페이지로 리다이렉트
            e.printStackTrace();
            return "redirect:/freeList";
        }
        // 게시글 상세 내용을 보여줄 View 이름 반환
        return "free/freeView";
    }
    @RequestMapping("/freeForm")
    public String freeForm() {
        return "free/freeForm";
    }
    
	
	  @RequestMapping("/freeBoardWriteDo") public String
	  freeBoardWriteDo(FreeBoardVO freeBoardVO, HttpSession session) throws
	  Exception { freeService.insertFreeBoard(freeBoardVO); // 세션에서 로그인 사용자 정보 가져오기
	  MemberVO loginUser = (MemberVO) session.getAttribute("login");
	  if(loginUser != null) freeBoardVO.setMemId(loginUser.getMemId());
	  return "redirect:/freeList"; }

}