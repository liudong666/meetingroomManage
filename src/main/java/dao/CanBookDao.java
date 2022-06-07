package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dtoin.MyBookTime;
import entity.CanBook;

public interface CanBookDao {

	/**
	 * 根据canBookId返回一条可预约时间
	 * 
	 * @param canBookId
	 * @return
	 */
	public MyBookTime getById(@Param("canBookId") String canBookId);

	/**
	 * 根据canBookId返回对应roomNumber
	 * 
	 * @param canBookId
	 * @return
	 */
	public String getRoomNumberById(@Param("canBookId") String canBookId);

	/**
	 * 根据canBookId删除所有canBook表数据（更新的第一步）
	 * 
	 * @param canBookId
	 * @return
	 */
	public boolean deleteById(@Param("canBookId") String canBookId);

	/**
	 * 批量添加canBook表新数据（更新的第二步）
	 * 
	 * @param myBookTimeList
	 * @return
	 */
	public int batchInsert(List<CanBook> canBookList);

}
