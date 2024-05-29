package com.proj.my.board.vo;

public class BoardVO {
	private Integer boardNo;
	private String boardTitle;
	private String memId;
	private String memNm;
	private String boardContent;
	private String boardDate;
	
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String mem_Id) {
		this.memId = mem_Id;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", memId=" + memId + ", memNm=" + memNm
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + "]";
	}
	
	

}
