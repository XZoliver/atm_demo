package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.Admin;
import com.entity.User;
import com.entity.loginInfo;
import com.serviceimpl.AdminServiceImpl;
import com.serviceimpl.UserServiceImpl;

/*
 *创建人：肖易安
 *创建时间：2019年7月15日
 */
@Controller
@RequestMapping("main")
public class mainController {
	private static final Logger LOG = Logger.getLogger(UserController.class);
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private AdminServiceImpl adminService;

	// index
	@RequestMapping("")
	public String index() {
		return "index";
	}

	// 注册
	@RequestMapping(value = "/registe", method = RequestMethod.GET)
	public String registe() {

		LOG.info("registe...");
		return "registe";
	}

	@RequestMapping(value = "/registe", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String registed(User user) {
		String cardno = userService.createCardno();
		user.setCardno(cardno);
		user.setState(true);
		userService.insert(user);
		String url = "redirect:/main/success?number=".concat(cardno);
		return url;
	}

	@RequestMapping(value = "/success", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String registeSuccess() {
		LOG.info("registe success");
		return "success";
	}

	// 用户登入
	@RequestMapping(value = "/user_login", method = RequestMethod.GET)
	public String user_login() {
		LOG.info("user login...");
		return "user_login";
	}

	@RequestMapping(value = "/user_login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String user_login(loginInfo info, HttpServletResponse response, HttpServletRequest req,
			HttpSession session) {
		LOG.info(info);
		User user = new User();
		user.setCardno(info.getPassname());
		user.setPasskey(info.getPassnum());
		user = userService.login(user);
		LOG.info(user);
		if (user == null) {
			return "redirect:/main/user_login?error=a";
		} else if (!user.getState()) {
			return "redirect:/main/user_login?error=b";
		} else {
			String mySex;
			if (user.getSex().equals("男")) {
				mySex = "先生";
			} else {
				mySex = "女士";
			}
			session.setAttribute("mySex", mySex);
			session.setAttribute("user", user);
			return "redirect:/user/login";
		}
	}

	// 管理员登入
	@RequestMapping(value = "/gover_login", method = RequestMethod.GET)
	public String gover_login() {
		LOG.info("admin login...");
		return "gover_login";
	}

	@RequestMapping(value = "/gover_login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String gover_login(loginInfo info, HttpServletResponse response, HttpServletRequest req,
			HttpSession session) {
		LOG.info(info);
		Admin admin = new Admin();
		admin.setAcoount(info.getPassname());
		admin.setAdminkey(info.getPassnum());
		admin = adminService.adminLogin(admin);
		if (admin == null) {
			return "redirect:/main/gover_login?error=a";
		} else {
			session.setAttribute("admin", admin);
			return "redirect:/admin/admin_index";
		}
	}

}
