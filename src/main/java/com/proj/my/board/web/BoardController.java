package com.proj.my.board.web;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.my.board.service.BoardService;
import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;
import com.proj.my.member.vo.MemberVO;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
//
//	@Autowired
//	CodeService codeService;
//	
//	// 해당 컨트롤러에서 연결되는 모든 화면에서 comList를 모두 사용가능.
//	@ModelAttribute("comList")
//	public List<CodeVO> getCodeList(){
//		return codeService.getCodeList(null); 
//	}
	// 게시판 목록을 보여주는 메서드
	@RequestMapping("/boardView")
	public String boardView(Model model, HttpSession session) {
		// 게시글 목록을 가져와서 모델에 추가
		List<BoardVO> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		return "board/boardView";
	}

	// 게시글 작성 화면으로 이동하는 메서드
	@RequestMapping("/boardWriteView")
	public String boardWriteView(HttpSession session) {
		// 로그인 여부 확인 후 로그인이 되어 있지 않으면 로그인 화면으로 리다이렉트
		if (session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		return "board/boardWriteView";
	}

	// 게시글 작성을 처리하는 메서드
	@RequestMapping("/boardWriteDo")
	public String boardWriteDo(HttpSession session, BoardVO board) throws Exception {
		// 현재 로그인된 사용자 정보를 가져와서 게시글 작성자로 설정
		MemberVO vo = (MemberVO) session.getAttribute("login");
		board.setMemId(vo.getMemId());
		// 게시글을 작성하고 게시판 목록 화면으로 리다이렉트
		boardService.writeBoard(board);
		return "redirect:/boardView";
	}

	// 게시글 상세 조회 화면으로 이동하는 메서드
	@RequestMapping("/boardDetailView")
	public String boardDetailView(int boardNo, Model model) throws Exception {
		// 게시글 번호를 이용하여 해당 게시글 정보를 가져와서 모델에 추가
		BoardVO vo = boardService.getBoard(boardNo);
		List<ReplyVO> replyList = boardService.getReplyList(boardNo);//댓글
		model.addAttribute("board", vo);
		model.addAttribute("replyList", replyList); //댓글
		return "board/boardDetailView";
	}
	
	// 게시글 수정 화면으로 이동하는 메서드입니다.
	@RequestMapping(value="/boardEditView", method=RequestMethod.POST)
	public String boardEditView(int boardNo, Model model) throws Exception {
	    // 게시글 번호를 이용하여 해당 게시글 정보를 가져와서 모델에 추가합니다.
	    BoardVO vo = boardService.getBoard(boardNo);
	    model.addAttribute("board", vo); // 모델에 게시글 정보를 추가합니다.
	    return "board/boardEditView"; // 게시글 수정 화면의 뷰 이름을 반환합니다.
	}
	
	// 게시글 수정을 처리하는 메서드입니다.
	@RequestMapping("/boardEditDo")
	public String boardEditDo(BoardVO vo, Model model) throws Exception {
	    // 게시글을 수정하고 수정된 게시글 화면으로 이동합니다.
	    boardService.updateBoard(vo); // 게시글을 수정하는 서비스 메서드를 호출합니다.
	    return "redirect:/boardView"; // 수정된 게시글 화면으로 이동하기 위해 boardView로 리다이렉트합니다.
	}
	
	@RequestMapping(value="/boardDel", method=RequestMethod.POST)
	public String boardDel(int boardNo, Model model) throws Exception {
	    // 게시글 번호를 이용하여 해당 게시글 정보를 가져와서 모델에 추가합니다.
	    boardService.deleteBoard(boardNo);
	    return "redirect:/boardView"; // 수정된 게시글 화면으로 이동하기 위해 boardView로 리다이렉트합니다.
	}
	// @ResponseBody 객체를 json 데이터 형태로 리턴
	@ResponseBody
	@PostMapping("/writeReplyDo")  // @RequestBody json 데이터 형태로  요청을 받음
	public ReplyVO writeReplyDo(@RequestBody ReplyVO vo) throws Exception {
		System.out.println(vo);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		String uniqu = sdf.format(date);
		vo.setReplyNo(uniqu);
		boardService.writeReply(vo);
		ReplyVO result = boardService.getReply(uniqu);
		return result;
	}
	
}





//이 코드는 Spring MVC에서 게시판 관련 기능을 처리하는 컨트롤러입니다. 각 메서드에 주석을 달아서 설명하겠습니다:
//
//@Autowired BoardService boardService;: BoardService 타입의 빈(Bean)을 자동으로 주입합니다.
//
//@RequestMapping("/boardView"): URL 패턴이 "/boardView"인 요청을 처리합니다. 게시글 목록을 가져와서 board/boardView 뷰로 전달합니다.
//
//@RequestMapping("/boardWriteView"): URL 패턴이 "/boardWriteView"인 요청을 처리합니다. 로그인되어 있는지 확인한 후, 로그인되어 있지 않으면 로그인 화면으로 리다이렉트하고, 로그인되어 있으면 게시글 작성 화면으로 이동합니다.
//
//@RequestMapping("/boardWriteDo"): URL 패턴이 "/boardWriteDo"인 POST 요청을 처리합니다. 게시글을 작성하고 작성된 게시글을 데이터베이스에 저장한 후, 게시글 목록 화면으로 리다이렉트합니다.
//
//@RequestMapping("/boardDetailView"): URL 패턴이 "/boardDetailView"인 요청을 처리합니다. 요청된 게시글 번호에 해당하는 게시글을 가져와서 상세 조회 화면으로 전달합니다.
//
//@RequestMapping(value="/boardEditView", method=RequestMethod.POST): URL 패턴이 "/boardEditView"이고, POST 메서드 요청을 처리합니다. 요청된 게시글 번호에 해당하는 게시글을 가져와서 수정 화면으로 전달합니다.
//
//@RequestMapping("/boardEditDo"): URL 패턴이 "/boardEditDo"인 요청을 처리합니다. 수정된 게시글을 데이터베이스에 저장한 후, 수정된 게시글 화면으로 이동합니다.



