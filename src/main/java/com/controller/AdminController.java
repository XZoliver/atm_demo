package com.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Admin;
import com.entity.Notice;
import com.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.serviceimpl.AdminServiceImpl;
import com.serviceimpl.UserServiceImpl;

/*
 *创建人：肖易安
 *创建时间：2019年7月12日
 */
@Controller
@RequestMapping("admin")
public class AdminController {
	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Autowired
	private AdminServiceImpl adminService;
	@Autowired
	private UserServiceImpl userService;

	// 修改公告
	@RequestMapping("/notice")
	public String updateNotice(String content, HttpServletRequest req, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		admin = adminService.adminLogin(admin);
		if (admin != null) {
			List<Notice> noticeList = userService.getNotice();
			if (noticeList.size() > 0) {

				req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
			}
			if (content == null) {
				return "admin_information";
			} else {
				String num = String.valueOf(adminService.noticeNum());
				Date date = new Date(System.currentTimeMillis());
				Notice notice = new Notice();
				notice.setNoticeno(num);
				notice.setPbtime(date);
				notice.setContent(content);
				adminService.insertNotice(notice);
				// 跳转成功页面
				return "redirect:/admin/notice?result=a";
			}
		} else {
			return "redirect:/main";
		}
	}

	// 更改用户状态
	@RequestMapping("/disable")
	public String adminDisable(String cardno, Integer pageNum, Integer maxPage, HttpServletRequest req,
			HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		admin = adminService.adminLogin(admin);
		if (admin != null) {
			List<Notice> noticeList = userService.getNotice();
			if (noticeList.size() > 0) {

				req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
			}
			if (adminService.getState(cardno) == 1) {
				adminService.disable(cardno);
			} else {
				adminService.able(cardno);
			}
			String url = "redirect:/admin/getUserPage?pageNum=" + pageNum + "&maxPage=" + maxPage;
			return url;
		} else {
			return "redirect:/main";
		}
	}

	// 功能索引
	@RequestMapping("/admin_index")
	public String adminIndex(HttpServletRequest req, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		admin = adminService.adminLogin(admin);
		if (admin != null) {
			List<Notice> noticeList = userService.getNotice();
			if (noticeList.size() > 0) {

				req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
			}
			return "admin_function";
		} else {
			return "redirect:/main";
		}
	}

	// 修改密码
	@RequestMapping("/updatePassword")
	public String updatePassword(String newWord, HttpServletRequest req, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		admin = adminService.adminLogin(admin);
		if (admin != null) {
			List<Notice> noticeList = userService.getNotice();
			if (noticeList.size() > 0) {

				req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
			}
			if (newWord == null) {
				return "admin_passkey";
			} else {
				adminService.adminNewKey(admin, newWord);
				// 修改成功返回成功页
				return "redirect:/admin/updatePassword?result=a";
			}
		} else {
			return "redirect:/main";
		}
	}

	// 用户管理
	@RequestMapping("/getUser")
	public String getUser(HttpServletRequest req, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		admin = adminService.adminLogin(admin);
		if (admin != null) {
			List<Notice> noticeList = userService.getNotice();
			if (noticeList.size() > 0) {

				req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
			}
			PageHelper.startPage(1, 10);
			List<User> userList = adminService.getAllUser();
			PageInfo<User> pageInfo = new PageInfo<>(userList, 10);
			req.setAttribute("pageInfo", pageInfo);
			req.setAttribute("userList", userList);
			return "admin_user_gover";
		} else {
			return "redirect:/main";
		}
	}

	// 用户管理的分页系统
	@RequestMapping("/getUserPage")
	public String getUserPage(Integer pageNum, Integer maxPage, HttpServletRequest req, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		admin = adminService.adminLogin(admin);
		if (admin != null) {
			List<Notice> noticeList = userService.getNotice();
			if (noticeList.size() > 0) {

				req.setAttribute("notice", noticeList.get(noticeList.size() - 1));
			}
			if (pageNum <= 1) {
				pageNum = 1;
			} else if (pageNum >= maxPage) {
				pageNum = maxPage;
			}
			PageHelper.startPage(pageNum, 10);
			List<User> userList = adminService.getAllUser();
			PageInfo<User> pageInfo = new PageInfo<>(userList, 10);

			req.setAttribute("pageInfo", pageInfo);

			req.setAttribute("userList", userList);

			return "admin_user_gover";
		} else {
			return "redirect:/main";
		}
	}

	// 退出
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
}
