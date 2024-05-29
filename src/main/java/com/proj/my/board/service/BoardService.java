package com.proj.my.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.my.board.dao.IBoardDAO;
import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;

@Service
public class BoardService {
	
	@Autowired
	IBoardDAO dao;  // IBoardDAO 타입의 객체를 자동으로 주입받음
	
	// 게시글 목록을 가져오는 메서드
	public List<BoardVO> getBoardList(){
		// dao 객체를 사용하여 게시글 목록을 조회하고 반환
		List<BoardVO> result = dao.getBoardList();
		return result;
	}
	
	// 게시글을 등록하는 메서드
		public void writeBoard(BoardVO vo) throws Exception {
			// dao 객체를 사용하여 게시글을 등록하고 그 결과를 확인
			int result = dao.writeBoard(vo);
			// 만약 등록 결과가 실패(0)이면 예외를 발생시킴
			if(result == 0) {
				throw new Exception();
			}
		}
		
		// 게시글의 상세 정보를 가져오는 메서드
		public BoardVO getBoard(int boardNo) throws Exception {
			// dao 객체를 사용하여 게시글의 상세 정보를 조회하고 반환
			BoardVO result = dao.getBoard(boardNo);
			// 조회 결과가 없으면 예외를 발생시킴
			if(result == null) {
				throw new Exception();
			}
			return result;
		}
		
		// 게시글을 수정하는 메서드입니다.
		public void updateBoard(BoardVO vo) throws Exception {
		    // DAO 객체를 사용하여 게시글을 수정하고 그 결과를 확인합니다.
		    int result = dao.updateBoard(vo);
		    // 만약 수정 결과가 실패(0)이면 예외를 발생시킵니다.
		    if(result == 0) {
		        throw new Exception();
		    }
		}
		
		// 게시글 삭제
		public void deleteBoard(int boardNo) throws Exception {
			int result = dao.deleteBoard(boardNo);
			// 만약 수정 결과가 실패(0)이면 예외를 발생시킵니다.
			if(result == 0) {
				throw new Exception();
			}
		}
		
		// 댓글 등록
		public void writeReply(ReplyVO vo) throws Exception {
			int result = dao.writeReply(vo);
			if(result == 0) {
				throw new Exception();
			}
		}
			
		
		// 댓글 조회
		public ReplyVO getReply(String replyNo) throws Exception {
			ReplyVO result = dao.getReply(replyNo);
			if(result == null) throw new Exception();
			return result;
		}
			
		
		// 댓글 리스트 조회
		public List<ReplyVO> getReplyList(int boardNo) throws Exception{
			List<ReplyVO> result = dao.getReplylist(boardNo);
			if(result == null) throw new Exception();
			return result;
		}
	

}
