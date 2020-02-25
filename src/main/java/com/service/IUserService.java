package com.service;

import java.sql.Date;
import java.util.List;

import com.entity.Notice;
import com.entity.Record;
import com.entity.User;

public interface IUserService {

	// 用户注册
	User userRegist(User user);

	// 系统生成卡号
	String createCardno();

	// 插入数据库
	int insert(User user);

	// 用户登录
	User login(User user);

	// 账户余额查询
	double queryBalance(User user);

	// 用户信息查询
	User queryUserInfo(User user);

	// 用户信息修改
	User alterUserInfo(User user);

	// 用户转账
	User transferAccount(User user, User userAim, double amount);

	// 密码修改
	User alterUserPasskey(User user, String newPasskey);

	User getUserById(String cardno);

	// 账户明细查询
	List<Record> queryRecord(User user);

	// 获取公告
	List<Notice> getNotice();

	// 系统生成记录编号
	String createRecordno();

	String createRecordno(Date date);

	// 获取用户状态
	int getState(String cardno);

	// 更新账户
	User update(User user);

	// List<User> getAllUsers();
	//
	// int removeUserByCard(String cardno);
	//
	// int updateUser_pass(User user);
	//
	//
	// List<User> isRepeat(String cardno);
	//
	// List<User> check(String cardno, String passkey);

	boolean updateMessage(User user);
}
