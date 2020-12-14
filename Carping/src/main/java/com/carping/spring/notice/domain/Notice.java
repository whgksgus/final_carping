package com.carping.spring.notice.domain;

import java.sql.Date;

public class Notice {
	private int nKey;
	private String nTitle;
	private String nContent;
	private Date nWriteDate;
	private int nCount;
	private String memberId;
	
	public Notice() {
		super();
	}

	public Notice(int nKey, String nTitle, String nContent, Date nWriteDate, int nCount, String memberId) {
		super();
		this.nKey = nKey;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriteDate = nWriteDate;
		this.nCount = nCount;
		this.memberId = memberId;
	}

	public int getnKey() {
		return nKey;
	}

	public void setnKey(int nKey) {
		this.nKey = nKey;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnWriteDate() {
		return nWriteDate;
	}

	public void setnWriteDate(Date nWriteDate) {
		this.nWriteDate = nWriteDate;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Notice [nKey=" + nKey + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriteDate=" + nWriteDate
				+ ", nCount=" + nCount + ", memberId=" + memberId + "]";
	}
	
	
}
