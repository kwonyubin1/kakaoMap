package com.proj.my.cook.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;
import com.proj.my.cook.service.CookService;
import com.proj.my.cook.vo.CookVO;
import com.proj.my.member.vo.MemberVO;

@Controller
public class CookController {
	@Autowired
	CookService cookService;
	
	// 게시판 목록을 보여주는 메서드
		@RequestMapping("/CookView")
		public String cookView(Model model, HttpSession session) {
			// 게시글 목록을 가져와서 모델에 추가
			List<CookVO> cookList = cookService.getCookList();
			model.addAttribute("cookList", cookList);
			return "cook/cookView";
		}
		
		// 게시글 작성 화면으로 이동하는 메서드
		@RequestMapping("/cookWriteView")
		public String boardWriteView(HttpSession session) {
			// 로그인 여부 확인 후 로그인이 되어 있지 않으면 로그인 화면으로 리다이렉트
			if (session.getAttribute("login") == null) {
				return "redirect:/loginView";
			}
			return "cook/cookWriteView";
		}
	
	/*
	 * // 게시글 작성을 처리하는 메서드
	 * 
	 * @RequestMapping("/cookWriteDo") public String cookWriteDo(HttpSession
	 * session, CookVO cook) throws Exception { // 현재 로그인된 사용자 정보를 가져와서 게시글 작성자로 설정
	 * MemberVO vo = (MemberVO) session.getAttribute("login");
	 * board.setMemId(vo.getMemId()); // 게시글을 작성하고 게시판 목록 화면으로 리다이렉트
	 * boardService.writeBoard(board); return "redirect:/boardView"; }
	 */

		@PostMapping("/cookWriteDo")
	    public String recipeWriteDo(@ModelAttribute CookVO cookVO,
	                                @RequestParam("file") MultipartFile file,
	                                HttpSession session) throws IOException {
	        // 웹 접근 가능한 경로 설정
	        String webPath = "/resources/cook/";
	        // 서버 저장 폴더 경로
	        String folderPath = session.getServletContext().getRealPath(webPath);

	        // 파일이 업로드될 실제 경로
	        File folder = new File(folderPath);
	        if (!folder.exists()) {
	            folder.mkdirs(); // 폴더가 존재하지 않으면 생성
	        }

	        // 파일 이름 설정
	        String fileName = file.getOriginalFilename();
	        String filePath = folderPath + File.separator + fileName;

	        // 파일 업로드
	        try {
	            file.transferTo(new File(filePath));
	            // 파일 경로를 RecipeVO에 저장
	            cookVO.setCkImage(webPath + fileName);

	            // 세션에서 로그인 사용자 정보 가져오기
	            MemberVO loginUser = (MemberVO) session.getAttribute("login");
	            // 로그인 사용자의 ID를 RecipeVO에 설정
	            if (loginUser != null) {
	                cookVO.setMemId(loginUser.getMemId());
	            } else {
	                // 세션이 없거나 로그인 정보가 없는 경우 처리할 내용을 여기에 추가하십시오.
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 파일 업로드 실패 시 예외 처리 필요
	            return "errorPage";
	        }

	        try {
	            // recipeVO에 저장된 이미지 경로를 바탕으로 서비스 호출
	            cookService.insertCook(cookVO);
	            return "redirect:/CookView";
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 예외 처리 필요
	            return "errorPage";
	        }
	        
	    }	
		
		// 게시글 상세 조회 화면으로 이동하는 메서드
		@RequestMapping("/cookDetailView")
		public String cookDetailView(int ckNo, Model model) throws Exception {
			// 게시글 번호를 이용하여 해당 게시글 정보를 가져와서 모델에 추가
			CookVO vo = cookService.getCookBoard(ckNo);
			//List<ReplyVO> replyList = boardService.getReplyList(boardNo);//댓글
			model.addAttribute("cook", vo);
			//model.addAttribute("replyList", replyList); //댓글
			return "cook/cookDetailView";
		}
		
		// 게시글 수정 화면으로 이동하는 메서드입니다.
		@RequestMapping(value="/cookEditView", method=RequestMethod.POST)
		public String cookEditView(int ckNo, Model model) throws Exception {
		    // 게시글 번호를 이용하여 해당 게시글 정보를 가져와서 모델에 추가합니다.
		    CookVO vo = cookService.getCookBoard(ckNo);
		    model.addAttribute("cook", vo); // 모델에 게시글 정보를 추가합니다.
		    return "cook/cookEditView"; // 게시글 수정 화면의 뷰 이름을 반환합니다.
		}
		
		//게시글 수정
	    @PostMapping("/cookBoardEditDo")
	    public String recipeEdit(@ModelAttribute CookVO cookVO,
	                             @RequestParam("file") MultipartFile file,
	                             HttpSession session) throws IOException {
	        // 웹 접근 가능한 경로 설정
	        String webPath = "/resources/cook/";
	        // 서버 저장 폴더 경로
	        String folderPath = session.getServletContext().getRealPath(webPath);

	        // 파일이 업로드될 실제 경로
	        File folder = new File(folderPath);
	        if (!folder.exists()) {
	            folder.mkdirs(); // 폴더가 존재하지 않으면 생성
	        }

	        // 파일 이름 설정
	        String fileName = file.getOriginalFilename();
	        String filePath = folderPath + File.separator + fileName;

	        // 파일 업로드
	        try {
	            file.transferTo(new File(filePath));
	            // 파일 경로를 RecipeVO에 저장
	            cookVO.setCkImage(webPath + fileName);

	            // 세션에서 로그인 사용자 정보 가져오기
	            MemberVO loginUser = (MemberVO) session.getAttribute("login");
	            // 로그인 사용자의 ID를 RecipeVO에 설정
	            if (loginUser != null) {
	                cookVO.setMemId(loginUser.getMemId());
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 파일 업로드 실패 시 예외 처리 필요
	            return "errorPage";
	        }

	        try {
	            // recipeVO에 저장된 이미지 경로를 바탕으로 서비스 호출
	            cookService.updateCookBoard(cookVO);
	            return "redirect:/CookView";
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 예외 처리 필요
	            return "errorPage";
	        }
	    }
	    
	    // 게시글 삭제
	    @RequestMapping(value="/cookboardDel", method=RequestMethod.POST)
		public String cookboardDel(int ckNo, Model model) throws Exception {
		    // 게시글 번호를 이용하여 해당 게시글 정보를 가져와서 모델에 추가합니다.
		    cookService.deleteCookBoard(ckNo);
		    return "redirect:/CookView"; // 수정된 게시글 화면으로 이동하기 위해 boardView로 리다이렉트합니다.
		}
	
	 /* 
	
	 * @PostMapping("/writeReplyDo") // @RequestBody json 데이터 형태로 요청을 받음 public
	 * System.out.println(vo); Date date = new Date(); SimpleDateFormat sdf = new
	 * SimpleDateFormat("yyMMddHHmmssSSS"); String uniqu = sdf.format(date);
	 * vo.setReplyNo(uniqu); boardService.writeReply(vo); ReplyVO result =
	 * boardService.getReply(uniqu); return result; }
	 */
	 
	/*
	 * @RequestMapping("/CookView") public String cooklikeView(Model model,
	 * HttpSession session) { // 게시글 목록을 가져와서 모델에 추가 List<CookVO> cooSelectkList =
	 * cookService.likeSelect(); model.addAttribute("cooSelectkList",
	 * cooSelectkList); return "cook/cookView"; }
	 */
	    
	/*
	 * @RequestMapping(value="/cookDel", method=RequestMethod.POST) public String
	 * cookDel(int cookNo, Model model) throws Exception { // 게시글 번호를 이용하여 해당 게시글
	 * 정보를 가져와서 모델에 추가합니다. cookService.deleteCookBoard(ckNo); return
	 * "redirect:/cookView"; // 수정된 게시글 화면으로 이동하기 위해 boardView로 리다이렉트합니다. }
	 */
}
