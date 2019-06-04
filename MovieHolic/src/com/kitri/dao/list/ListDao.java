package com.kitri.dao.list;

public class ListDao {
	
	////singleTone ////
	private static ListDao listDao;
	static {
		listDao = new ListDao();
	}
	private ListDao() {}
	public static ListDao getListDao() {
		return listDao;
	}
}
