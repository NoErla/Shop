package st.myc.shop.dao.tbOrder;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.TbOrder;
import st.myc.shop.entity.vo.TbOrderVo;

@Repository
public interface TbOrderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(TbOrder record);

    int insertSelective(TbOrder record);

    TbOrder selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(TbOrder record);

    int updateByPrimaryKey(TbOrder record);
    
    List<TbOrderVo> getVoByUserId(@Param("userId") Integer userId);
    
    List<TbOrderVo> getDynamicList(TbOrder record);
    
    Integer getDynamicCount(TbOrder record);
}