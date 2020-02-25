package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDao;
import com.entity.Admin;
import com.entity.Notice;
import com.entity.User;
import com.service.IAdminService;

/*
 *创建人：肖易安
 *创建时间：2019年7月12日
 */
@Service // 标记当前类是service
public class AdminServiceImpl implements IAdminService {
	@Autowired
	private AdminDao adminDao;

	@Override
	public Admin adminLogin(Admin admin) {
		admin = adminDao.adminLogin(admin);
		return admin;
	}

	@Override
	public List<User> getAllUser() {
		return adminDao.getAllUser();
	}

	@Override
	public int adminNewKey(Admin admin, String newWord) {
		if (!(newWord == null)) {
			admin.setAdminkey(newWord);
		}
		return adminDao.adminNewKey(admin);
	}

	@Override
	public int disable(String cardno) {
		return adminDao.disable(cardno);
	}

	@Override
	public int userNum() {
		return adminDao.userNum();
	}

	@Override
	public int getState(String cardno) {
		return adminDao.getState(cardno);
	}

	@Override
	public int able(String cardno) {
		return adminDao.able(cardno);
	}

	@Override
	public int noticeNum() {
		return adminDao.noticeNum() + 1;
	}

	@Override
	public int insertNotice(Notice notice) {
		return adminDao.insertNotice(notice);
	}
}
