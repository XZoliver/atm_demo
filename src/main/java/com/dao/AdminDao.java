package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.entity.Admin;
import com.entity.Notice;
import com.entity.User;

/*
 *创建人：肖易安
 *创建时间：2019年7月12日
 */
@Mapper // 标记当前类为功能映射文件
public interface AdminDao {
	@Select("select * from admin where acoount=#{acoount} and adminkey=#{adminkey}")
	Admin adminLogin(Admin admin);

	@Select("select * from user")
	List<User> getAllUser();

	@Update("update admin set adminkey=#{adminkey} where acoount=#{acoount}")
	int adminNewKey(Admin admin);

	@Update("update user set state = 0 where cardno = #{cardno}")
	int disable(String cardno);

	@Update("update user set state = 1 where cardno = #{cardno}")
	int able(String cardno);

	@Select("select count(*)from user")
	int userNum();

	@Select("select state from user where cardno = #{cardno}")
	int getState(String cardno);

	@Select("select count(*)from notice")
	int noticeNum();

	@Update("insert into notice values (#{noticeno},#{pbtime},#{content})")
	int insertNotice(Notice notice);
}
