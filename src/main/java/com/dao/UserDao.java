package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.entity.User;

@Mapper // 标记当前类为功能映射文件
public interface UserDao {
	@Insert("insert into user (cardno, username,id,sex,tele,state,passkey,address,balance) values (#{cardno},#{username},"
			+ "#{id},#{sex},#{tele},#{state},#{passkey},#{address},#{balance})")
	@Options(useGeneratedKeys = true, keyProperty = "cardno")
	int insert(User user);

	@Select("select * from user where cardno=#{cardno} and passkey=#{passkey}")
	User login(User user);

	@Select("select * from user")
	List<User> getAllUsers();

	@Delete("delete from user where cardno=#{cardno}")
	int removeUserByCard(String cardno);

	@Update("update user set passkey=#{passkey} where cardno=#{cardno}")
	int updateUser_pass(User user);

	@Select("select * from user where cardno=#{cardno}")
	User getUserById(String cardno);

	@Select("select * from user where cardno=#{cardno}")
	List<User> isRepeat(String cardno);

	@Select("select * from user where cardno=#{cardno} and passkey=#{passkey}")
	List<User> check(String cardno, String passkey);

	@Update("update user set balance=#{balance} where cardno=#{cardno}")
	int changeBalance(@Param("balance") double balance, @Param("cardno") String cardno);

	@Update("update user set username=#{username},tele=#{tele},address=#{address} where cardno=#{cardno}")
	boolean updateMessage(User user);

	@Select("select state from user where cardno=#{cardno}")
	int getSate(String cardno);

}
