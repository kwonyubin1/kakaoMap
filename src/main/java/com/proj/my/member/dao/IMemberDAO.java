package com.proj.my.member.dao;

import java.lang.reflect.Member;

import org.apache.ibatis.annotations.Mapper;

import com.proj.my.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	
	// 회원가입
	public int registMember(MemberVO vo);

	// 회원조회
	public MemberVO loginMember(MemberVO vo);

	// 회원수정
	public int updateMember(MemberVO vo);

	// 프로필 이미지 경로 저장
	public int profileUpload(MemberVO vo);

	// 아이디 중복 검사
	public int idCheck(String memId); // 이미 사용 중인 아이디인지 확인
}
