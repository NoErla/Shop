package st.myc.shop.dao.mapper;

import st.myc.shop.entity.TbOrder;

public interface TbOrderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(TbOrder record);

    int insertSelective(TbOrder record);

    TbOrder selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(TbOrder record);

    int updateByPrimaryKey(TbOrder record);
}