package com.proj.my.cook.vo;

public class CookVO {
	private Integer ckNo;
	private String memId;
	private String ckImage;
	private String ckCategory;
	private String ckTitle;
	private String ckContent;
	private String ckHit;
	private String ckRegDate;
	public Integer getCkNo() {
		return ckNo;
	}
	public void setCkNo(Integer ckNo) {
		this.ckNo = ckNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getCkImage() {
		return ckImage;
	}
	public void setCkImage(String ckImage) {
		this.ckImage = ckImage;
	}
	public String getCkCategory() {
		return ckCategory;
	}
	public void setCkCategory(String ckCategory) {
		this.ckCategory = ckCategory;
	}
	public String getCkTitle() {
		return ckTitle;
	}
	public void setCkTitle(String ckTitle) {
		this.ckTitle = ckTitle;
	}
	public String getCkContent() {
		return ckContent;
	}
	public void setCkContent(String ckContent) {
		this.ckContent = ckContent;
	}
	public String getCkHit() {
		return ckHit;
	}
	public void setCkHit(String ckHit) {
		this.ckHit = ckHit;
	}
	public String getCkRegDate() {
		return ckRegDate;
	}
	public void setCkRegDate(String ckRegDate) {
		this.ckRegDate = ckRegDate;
	}
	@Override
	public String toString() {
		return "CookVO [ckNo=" + ckNo + ", memId=" + memId + ", ckImage=" + ckImage + ", ckCategory=" + ckCategory
				+ ", ckTitle=" + ckTitle + ", ckContent=" + ckContent + ", ckHit=" + ckHit + ", ckRegDate=" + ckRegDate
				+ "]";
	}
	
	
}
