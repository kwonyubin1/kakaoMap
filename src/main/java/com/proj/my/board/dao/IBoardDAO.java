package com.proj.my.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.my.board.vo.BoardVO;
import com.proj.my.board.vo.ReplyVO;

@Mapper
public interface IBoardDAO {
	
	// 게시글 조회
	public List<BoardVO> getBoardList();

	// 게시글 등록
	public int writeBoard(BoardVO vo);

	// 게시글 상세조회
	public BoardVO getBoard(int boardNo);
	
	// 게시글 수정하기
	public int updateBoard(BoardVO vo);
	
	// 게시글 삭제학기
	public int deleteBoard(int boardNo);
	
	// 댓글 등록
	public int writeReply(ReplyVO vo);

	// 댓글 조회
	public ReplyVO getReply(String replyNo);

	// 댓글 리스트 조회
	public List<ReplyVO> getReplylist(int boardNo);

}
