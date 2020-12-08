package com.carping.spring.notice.service;

import java.util.ArrayList;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.notice.domain.Notice;
import com.carping.spring.notice.store.NoticeStore;

public class NoticeServiceImpl implements NoticeService  {

	private NoticeStore nStore;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addReadCount(int nKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice selectNotice(int nKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int nKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Notice> selectSearchList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

}
