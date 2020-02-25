package com.serviceimpl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.NoticeDao;
import com.dao.RecordDao;
import com.dao.UserDao;
import com.entity.Notice;
import com.entity.Record;
import com.entity.User;
import com.service.IUserService;

@Service // 标记当前类是service
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserDao userDao;

	@Autowired
	private RecordDao recordDao;

	@Autowired
	private NoticeDao noticeDao;

	// 注册
	@Override
	public User userRegist(User user) {
		// check
		user.setCardno(createCardno());
		if (insert(user) == 1) {
			return user;
		} else {
			return null;
		}
	}

	@Override
	public String createCardno() {

		String cardno = "";
		do {
			for (int i = 0; i < 20; i++) {
				cardno += (String.valueOf((int) (Math.random() * 10)));
			}
		} while (userDao.isRepeat(cardno).size() != 0);
		return cardno;
	}

	@Override
	public int insert(User user) {
		return userDao.insert(user);
	}

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public double queryBalance(User user) {

		user = userDao.getUserById(user.getCardno());

		return user.getBalance();
	}

	@Override
	public User queryUserInfo(User user) {

		User userHidden = userDao.getUserById(user.getCardno());
		if (userHidden == null) {
			return null;
		}
		String userNameHidden = userHidden.getUsername().substring(0, 1);

		for (int i = 1; i < userHidden.getUsername().length(); i++) {
			userNameHidden.concat("*");
		}
		userHidden.setUsername(userNameHidden);
		if (user.getTele() != null) {

			int numberOfShow = Math.min(4, userHidden.getTele().length());

			String teleHidden = userHidden.getTele().substring(0, numberOfShow);

			for (int i = 4; i < userHidden.getTele().length(); i++) {
				teleHidden.concat("*");
			}
			userHidden.setTele(teleHidden);
		}
		return userHidden;
	}

	// 弃用
	@Override
	public User alterUserInfo(User user) {

		User userNew = userDao.getUserById(user.getCardno());

		return userNew;
	}

	@Transactional
	@Override
	public User transferAccount(User user, User userAim, double amount) {
		// TODO 自动生成的方法存根

		Date date = new Date(System.currentTimeMillis());
		Record record1 = new Record();

		record1.setCardno(user.getCardno());
		record1.setAimcard(userAim.getCardno());
		record1.setAmount(amount);
		record1.setOptype("转出");
		record1.setRecordno(createRecordno(date));
		record1.setRecordtime(date);

		recordDao.insert(record1);

		user = update(user);

		double balance0 = user.getBalance() - amount;

		userDao.changeBalance(balance0, user.getCardno());

		userAim = update(userAim);

		double balance1 = userAim.getBalance() + amount;

		userDao.changeBalance(balance1, userAim.getCardno());

		return user;
	}

	@Override
	public User alterUserPasskey(User user, String newPasskey) {

		user.setPasskey(newPasskey);

		userDao.updateUser_pass(user);

		return user;
	}

	@Override
	public List<Record> queryRecord(User user) {

		List<Record> list = recordDao.getRecord(user.getCardno());

		for (int i = 0; i < list.size(); i++) {

			Record tempRecord = list.get(i);
			if (tempRecord.getAimcard().contentEquals(user.getCardno())) {
				tempRecord.setOptype("转出");
				list.set(i, tempRecord);
			}

		}

		return list;
	}

	@Override
	public User getUserById(String cardno) {

		return userDao.getUserById(cardno);
	}

	@Override
	public String createRecordno() {

		String recordno = "";
		do {
			for (int i = 0; i < 10; i++) {
				recordno += (String.valueOf((int) (Math.random() * 10)));
			}
		} while (recordDao.isRepeat(recordno).size() != 0);
		return recordno;
	}

	@Override
	public String createRecordno(Date date) {

		String recordno = date.toString().replace("-", "");
		long recordnum = Long.parseLong(recordno);
		recordnum *= 100;
		while (recordDao.isRepeat(String.valueOf(recordnum)).size() != 0) {

			recordnum++;
		}

		return String.valueOf(recordnum);
	}

	@Override
	public boolean updateMessage(User user) {
		return userDao.updateMessage(user);
	}

	@Override
	public List<Notice> getNotice() {
		return noticeDao.getAllNotice();
	}

	@Override
	public int getState(String cardno) {
		return userDao.getSate(cardno);
	}

	@Override
	public User update(User user) {
		return userDao.getUserById(user.getCardno());
	}

}
