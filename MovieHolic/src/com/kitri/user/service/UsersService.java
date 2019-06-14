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
	
	
	
	
	public UsersDto login(String userid) {
		return UsersDao.getUsersDao().selectById(userid);
	}
	
	
	public int registerMember(UsersDto usersDto) {
		return UsersDao.getUsersDao().registerMember(usersDto);
	}
	
	public int idCheck(String id) {
		return UsersDao.getUsersDao().idCheck(id);
	}
	
	
	
	
	
	

}






