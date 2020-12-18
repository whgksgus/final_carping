package com.carping.spring.notice.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.common.Search;
import com.carping.spring.notice.domain.Notice;
import com.carping.spring.notice.domain.PageInfo;

@Repository
public class NoticeStoreLogic implements NoticeStore {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return sqlSession.selectOne("NoticeMapper.getListCount");
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getnoticeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getnoticeLimit());
		return (ArrayList)sqlSession.selectList("NoticeMapper.selectList", null, rowBounds);
	}

	@Override
	public int addReadCount(int nKey) {
		return sqlSession.update("NoticeMapper.updateCount", nKey);
	}

	@Override
	public Notice selectNotice(int nKey) {

		return sqlSession.selectOne("NoticeMapper.selectOne", nKey);
	}

	@Override
	public int insertNotice(Notice notice) {
		return sqlSession.insert("NoticeMapper.insertNotice", notice);
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
		return (ArrayList)sqlSession.selectList("NoticeMapper.searchNotice", search);
	}

}
