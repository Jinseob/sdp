package com.find.someone.dao;

import java.util.List;

public interface CmmnDao {
	public List<?> selectList(String queryId, Object paramVO) throws Exception;
	
	public Object select(String queryId, Object paramVO) throws Exception;
	
	public int selectCnt(String queryId, Object paramVO) throws Exception;
	
	public void insert(String queryId, Object paramVO) throws Exception;
	
	public void update(String queryId, Object paramVO) throws Exception;
	
	public void delete(String queryId, Object paramVO) throws Exception;
}
