package com.proj.my.cook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;
import com.proj.my.cook.vo.CookVO;

@Mapper
public interface ICookDAO {
	// 게시글 조회
	public List<CookVO> getCookList();
	
	public List<CookVO> getCookList(CookVO cookVO);
	
	// 게시글 등록
	public int insertCook(CookVO vo);
	
	// 게시글 상세보기 
	public CookVO getCookBoard(int ckNo);
	
	// 게시글 조회수 증가
	public int cookincreaseHit(int ckNo);
	
	// 게시글 수정하기
	public int updateCookBoard(CookVO vo);
	
	// 게시글 삭제하기
	public int deleteCookBoard(int ckNo);

	// 조회수 상품정보 노출
	public List<CookVO> likeSelect();
		
	// 댓글 등록
	public int writeReply(ReplyVO vo);

	// 댓글 조회
	public ReplyVO getReply(String replyNo);

	// 댓글 리스트 조회
	public List<ReplyVO> getReplylist(int boardNo);
}
