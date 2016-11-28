package com.find.someone.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.find.someone.dao.CmmnDao;

@Repository
@Transactional
public class CmmnDaoImpl implements CmmnDao{

	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	@Override
	public List<?> selectList(String queryId, Object paramVO) throws Exception {
		return sqlMapClientTemplate.queryForList(queryId, paramVO);
	}

	@Override
	public Object select(String queryId, Object paramVO) throws Exception {
		return sqlMapClientTemplate.queryForObject(queryId, paramVO);
	}

	@Override
	public int selectCnt(String queryId, Object paramVO) throws Exception {
		return (Integer)sqlMapClientTemplate.queryForObject(queryId, paramVO);
	}

	@Override
	public void insert(String queryId, Object paramVO) throws Exception {
		sqlMapClientTemplate.insert(queryId, paramVO);
	}

	@Override
	public void update(String queryId, Object paramVO) throws Exception {
		sqlMapClientTemplate.update(queryId, paramVO);
	}

	@Override
	public void delete(String queryId, Object paramVO) throws Exception {
		sqlMapClientTemplate.delete(queryId, paramVO);
	}
}
