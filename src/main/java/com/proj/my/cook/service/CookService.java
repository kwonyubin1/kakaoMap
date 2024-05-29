package com.proj.my.cook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;
import com.proj.my.cook.dao.ICookDAO;
import com.proj.my.cook.vo.CookVO;

@Service
public class CookService {

	@Autowired
	ICookDAO dao;  // IBoardDAO 타입의 객체를 자동으로 주입받음
	
	// 게시글 목록을 가져오는 메서드
	public List<CookVO> getCookList(){
		// dao 객체를 사용하여 게시글 목록을 조회하고 반환
		return dao.getCookList();
	}
	
	// 게시글을 등록하는 메서드
			public void insertCook(CookVO vo) throws Exception {
				// dao 객체를 사용하여 게시글을 등록하고 그 결과를 확인
				int result = dao.insertCook(vo);
				// 만약 등록 결과가 실패(0)이면 예외를 발생시킴
				if(result == 0) {
					throw new Exception();
				}
			}
			
			// 게시글의 상세 정보를 가져오는 메서드
		 public CookVO getCookBoard(int ckNo) throws Exception {
				// dao 객체를 사용하여 게시글의 상세 정보를 조회하고 반환
				CookVO result = dao.getCookBoard(ckNo);
				// 조회 결과가 없으면 예외를 발생시킴
				if(result == null) {
					throw new Exception();
				}
				// 조회수 증가 처리
				dao.cookincreaseHit(ckNo);
				// 조회된 게시글 정보 반환
				return result;
			}		
		 
		// 게시글을 수정하는 메서드입니다.
			public void updateCookBoard(CookVO vo) throws Exception {
			    // DAO 객체를 사용하여 게시글을 수정하고 그 결과를 확인합니다.
			    int result = dao.updateCookBoard(vo);
			    // 만약 수정 결과가 실패(0)이면 예외를 발생시킵니다.
			    if(result == 0) {
			        throw new Exception();
			    }
			}
			
			// 게시글 삭제
			public void deleteCookBoard(int ckNo) throws Exception {
				int result = dao.deleteCookBoard(ckNo);
				// 만약 수정 결과가 실패(0)이면 예외를 발생시킵니다.
				if(result == 0) {
					throw new Exception();
				}
			}
			
			
			///메인화면 게시글 목록을 가져오는 메서드
			public List<CookVO> likeSelect(){
				// dao 객체를 사용하여 게시글 목록을 조회하고 반환
				return dao.likeSelect();
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

