package com.proj.my.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.my.free.dao.IFreeBoardDAO;
import com.proj.my.free.vo.FreeBoardVO;
import com.proj.my.free.vo.FreeSearchVO;

@Service
public class FreeService {
	
	@Autowired
	IFreeBoardDAO dao;
	
	// 게시글 목록을 가져오는 메서드
	public List<FreeBoardVO> getBoardList(FreeSearchVO searchVO){
		// 검색 조건에 따른 전체 건수를 조회
		int total = dao.getTotalRowCount(searchVO);
		// 전체 건수를 PaginVO에 설정
		searchVO.setTotalRowCount(total); // 수정된 부분
		// 페이지 설정을 위한 메서드 호출
		searchVO.pageSetting();
		// 게시글 목록을 조회하여 반환
		return dao.getBoardList(searchVO);
	}
	
	// 게시글 상세 정보를 가져오는 메서드
	public FreeBoardVO getBoard(int boNo) throws Exception {
		// 게시글 번호에 해당하는 게시글 정보 조회
		FreeBoardVO result = dao.getBoard(boNo);
		// 조회된 게시글이 없는 경우 예외 처리
		if(result == null) {
			throw new Exception();
		}
		// 조회수 증가 처리
		dao.increaseHit(boNo);
		// 조회된 게시글 정보 반환
		return result;
	}
	
	// 게시글 작성
	public void insertFreeBoard(FreeBoardVO vo) throws Exception {
		int result = dao.insertFreeBoard(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
}