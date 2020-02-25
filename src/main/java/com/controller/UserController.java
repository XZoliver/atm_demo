package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Notice;
import com.entity.Record;
import com.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.serviceimpl.UserServiceImpl;

@Controller
@RequestMapping("user")
public class UserController {
	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Autowired
	private UserServiceImpl userService;

	@RequestMapping("/balanceEnquiry")
	public String queryBalance(HttpServletRequest req, HttpSession session) {

		LOG.info("balance enquiry...");

		User user = (User) session.getAttribute("user");

		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}
		double balance = userService.queryBalance(user);
		req.setAttribute("balance", balance);

		return "balanceEnquiry";
	}

	@RequestMapping("/informationInquiry")
	public String queryUserInfo(HttpServletRequest req, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		LOG.info("information inquiry");
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}

		req.setAttribute("userHidden", userService.queryUserInfo(user));
		return "informationInquiry";
	}

	@RequestMapping("/tradingInquiry")
	public String queryRecordInfo(HttpServletRequest req, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}

		LOG.info("trading inquiry...");
		PageHelper.startPage(1, 5);

		List<Record> recordList = userService.queryRecord(user);
		PageInfo<Record> pageInfo = new PageInfo<>(recordList, 5);

		req.setAttribute("pageInfo", pageInfo);

		req.setAttribute("recordList", recordList);

		return "tradingInquiry0";
	}

	@RequestMapping("/tradingInquiry0")
	public String queryRecordInfo(HttpServletRequest req, HttpSession session, Integer pageNum, Integer maxPage) {

		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}
		if (pageNum <= 1) {
			pageNum = 1;
		} else if (pageNum >= maxPage) {
			pageNum = maxPage;
		}
		PageHelper.startPage(pageNum, 5);
		List<Record> recordList = userService.queryRecord(user);
		PageInfo<Record> pageInfo = new PageInfo<>(recordList, 5);

		req.setAttribute("pageInfo", pageInfo);

		req.setAttribute("recordList", recordList);

		return "tradingInquiry0";
	}

	@RequestMapping(value = "/changePasskey", method = RequestMethod.GET)
	public String init2(HttpServletRequest req, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		LOG.info("change passkey");
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}
		return "changePasskey";
	}

	@RequestMapping("/changePasskey")
	public String changePasskey(@RequestParam("old_passkey") String old_passkey,
			@RequestParam("new_passkey") String new_passkey, HttpServletRequest req, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}

		user = userService.getUserById(user.getCardno());
		if (user.getPasskey().equals(old_passkey)) {
			userService.alterUserPasskey(user, new_passkey);

			return "redirect:/user/changePasskey?result=a";
		} else
			return "redirect:/user/changePasskey?result=b";

	}

	@RequestMapping(value = "/transfer", method = RequestMethod.GET)
	public String transfer(HttpServletRequest req, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}

		return "transfer";
	}

	@RequestMapping("/transfer")
	public String zhuanzhaung(@RequestParam("passkey") String passkey, @RequestParam("toCardno") String toCardno,
			@RequestParam("money") String money, HttpSession session, HttpServletRequest req) {

		LOG.info("transfer...");
		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}

		if (user.getCardno().equals(toCardno))
			return "redirect:/user/transfer?result=e";
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}

		User userTo = userService.getUserById(toCardno);
		user = userService.getUserById(user.getCardno());
		if (userTo == null) {
			return "redirect:/user/transfer?result=c";
		}
		if (user.getBalance() < Double.valueOf(money)) {
			return "redirect:/user/transfer?result=d";
		}

		if (user.getPasskey().equals(passkey)) {
			userService.transferAccount(user, userTo, Double.valueOf(money));

			return "redirect:/user/transfer?result=a";
		} else
			return "redirect:/user/transfer?result=b";

	}

	@RequestMapping(value = "/informationModify", method = RequestMethod.GET)
	public String informationModify(HttpServletRequest req, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		List<Notice> noticeList = userService.getNotice();

		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}
		return "informationModify";
	}

	@RequestMapping("/informationModify")
	public String informationModify(User user, HttpServletResponse response, HttpServletRequest req,
			HttpSession session) {
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}

		LOG.info("information modify...");
		List<Notice> noticeList = userService.getNotice();

		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}

		LOG.info(user);
		userService.updateMessage(user);
		user = userService.update(user);
		req.setAttribute("user", user);
		return "informationModify";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		LOG.info("logout...");
		return "redirect:/main";
	}

	@RequestMapping("/login")
	public String login(HttpServletResponse response, HttpServletRequest req, HttpSession session) {
		LOG.info("login...");
		User user = (User) session.getAttribute("user");
		if (user == null || userService.getState(user.getCardno()) != 1) {
			return "redirect:/main";
		}
		List<Notice> noticeList = userService.getNotice();
		if (noticeList.size() > 0) {

			req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
		}

		return "login";

	}

}
