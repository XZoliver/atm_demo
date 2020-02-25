package com.service;

import java.util.List;

import com.entity.Admin;
import com.entity.Notice;
import com.entity.User;

/*
 *创建人：肖易安
 *创建时间：2019年7月12日
 */
public interface IAdminService {
	Admin adminLogin(Admin admin);

	List<User> getAllUser();

	int adminNewKey(Admin admin, String newWord);

	int disable(String cardno);

	int getState(String cardno);

	int able(String cardno);

	int userNum();

	int noticeNum();

	int insertNotice(Notice notice);
}
