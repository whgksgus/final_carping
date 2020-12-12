package com.carping.spring.notice.service;

import java.util.ArrayList;

import com.carping.spring.common.Search;
import com.carping.spring.notice.domain.Notice;
import com.carping.spring.notice.domain.PageInfo;

public interface NoticeService {
	public int getListCount();
	public ArrayList<Notice> selectList(PageInfo pi);
	public int addReadCount(int nKey);
	public Notice selectNotice(int nKey);
	public int insertNotice(Notice notice);
	public int updateNotice(Notice notice);
	public int deleteNotice(int nKey);
	public ArrayList<Notice> selectSearchList(Search search);
}
