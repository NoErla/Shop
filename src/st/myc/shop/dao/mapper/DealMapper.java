package st.myc.shop.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.Deal;
import st.myc.shop.entity.vo.DealVo;


@Repository
public interface DealMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Deal record);

    int insertSelective(Deal record);
    
    int insertFindId(Deal record);
    
    Deal selectByPrimaryKey(Integer id);
    
    Deal selectByIdAndLockIt(int id);
    
    
    List<DealVo> selectByUserId(int userId);
    
    List<DealVo> getDealListByPage(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListByPageAndUser(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListByPageAndMoneyDesc(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListByPageAndMoneyAsc(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListByPageAndMoneyFive(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListSuccess(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListFail(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListDelete(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListRefund(@Param("offset") int offset, @Param("rows") int rows);
    
    List<DealVo> getDealListRefundEd(@Param("offset") int offset, @Param("rows") int rows);
    
    int getDealCount(Deal record);

    int updateByPrimaryKeySelective(Deal record);

    int updateByPrimaryKeyWithBLOBs(Deal record);

    int updateByPrimaryKey(Deal record);

	List<DealVo> getDealListByOrderId(@Param("orderId")int orderId,@Param("offset") int offset, @Param("rows") int rows);

	int updateDealByMemo(Deal record);
	
    Integer getPaidAndCreateDealCountByUserIdAndProjectId(@Param("userId")int userId,@Param("projectSubId")int projectSubId);


}