package com.kitri.user.service;

import com.kitri.user.dao.UsersDao;
import com.kitri.user.dto.UsersDto;

public class UsersService {
	
	private static UsersService usersService;
	
	static {
		usersService = new UsersService();
	}

	private UsersService() {}
	
	public static UsersService getUsersService() {
		return usersService;
	}
	
	
	
	
	public UsersDto login(String userid, String pass) {
		
		return UsersDao.getUsersDao().selectById(userid);
	}
	
	
	
	
	
	
	
	
	

}






