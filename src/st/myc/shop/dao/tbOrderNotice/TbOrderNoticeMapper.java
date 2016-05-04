package st.myc.shop.dao.tbOrderNotice;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.TbOrderNotice;

@Repository
public interface TbOrderNoticeMapper {
    int deleteByPrimaryKey(Integer noticeId);

    int insert(TbOrderNotice record);

    int insertSelective(TbOrderNotice record);

    TbOrderNotice selectByPrimaryKey(Integer noticeId);

    int updateByPrimaryKeySelective(TbOrderNotice record);

    int updateByPrimaryKey(TbOrderNotice record);
    
    List<TbOrderNotice> selectByOrderId(@Param("orderId") Integer orderId);
}