package com.proj.my.free.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.my.free.vo.FreeBoardVO;
import com.proj.my.free.vo.FreeSearchVO;

@Mapper
public interface IFreeBoardDAO {
	
	// 게시글 전체 건수
	public int getTotalRowCount(FreeSearchVO searchVo);
	// 게시글 리스트
	public List<FreeBoardVO> getBoardList(FreeSearchVO searchVO);
	// 게시글 조회
	public FreeBoardVO getBoard(int boNo);
	// 게시글 조회수 증가
	public int increaseHit(int boNo);
	// 게시글 작성
	public int insertFreeBoard(FreeBoardVO vo);

}
