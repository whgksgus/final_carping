package com.carping.spring.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.common.Search;
import com.carping.spring.notice.domain.Notice;
import com.carping.spring.notice.domain.PageInfo;
import com.carping.spring.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService  {

	@Autowired
	private NoticeStore nStore;
	
	@Override
	public int getListCount() {
		return nStore.getListCount();
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nStore.selectList(pi);
	}

	@Override
	public int addReadCount(int nKey) {
		return nStore.addReadCount(nKey);
	}

	@Override
	public Notice selectNotice(int nKey) {
		return nStore.selectNotice(nKey);
	}

	@Override
	public int insertNotice(Notice notice) {
		return nStore.insertNotice(notice);
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
		return nStore.selectSearchList(search);
	}

}
