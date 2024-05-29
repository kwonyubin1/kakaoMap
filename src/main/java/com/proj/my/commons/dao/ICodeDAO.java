package com.proj.my.commons.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.my.commons.vo.CodeVO;

@Mapper
public interface ICodeDAO {
	// 공통코드 조회
	public List<CodeVO> getCodeList(String commParent);
}
