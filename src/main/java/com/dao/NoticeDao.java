package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.entity.Notice;

/**
 * 创建人：HDX 创建日期：2019年7月16日
 */
@Mapper
public interface NoticeDao {

	@Select("select * from notice")
	List<Notice> getAllNotice();

}
