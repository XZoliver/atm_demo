package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.entity.Record;

/**
 * 创建人：HDX 创建日期：2019年7月14日
 */
@Mapper
public interface RecordDao {

	@Insert("insert into record (cardno, recordno,optype,amount,recordtime,aimcard) values (#{cardno},#{recordno},"
			+ "#{optype},#{amount},#{recordtime},#{aimcard})")
	@Options(useGeneratedKeys = true, keyProperty = "recordno")
	int insert(Record record);

	@Select("select * from record")
	List<Record> getAllRecord();

	@Select("select * from record where cardno=#{cardno}")
	List<Record> getRecordByCardno(String cardno);

	@Select("select * from record where aimcard=#{aimcard}")
	List<Record> getRecordByAimcard(String cardno);

	@Select("select * from record where recordno=#{recordno}")
	List<Record> isRepeat(String recordno);

	@Select("select * from record where aimcard=#{cardno} or cardno=#{cardno} order by recordno desc")
	List<Record> getRecord(String cardno);

}
