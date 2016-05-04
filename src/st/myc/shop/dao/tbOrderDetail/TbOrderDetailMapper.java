package st.myc.shop.dao.tbOrderDetail;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.TbOrderDetail;
import st.myc.shop.entity.vo.TbOrderDetailVo;

@Repository
public interface TbOrderDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbOrderDetail record);

    int insertSelective(TbOrderDetail record);

    TbOrderDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbOrderDetail record);

    int updateByPrimaryKey(TbOrderDetail record);
    
    List<TbOrderDetailVo> getVoByOrderId(@Param("orderId") Integer orderId);
}