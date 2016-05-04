package st.myc.shop.dao.tbUserAddress;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.TbUserAddress;

@Repository
public interface TbUserAddressMapper {
    int deleteByPrimaryKey(Integer addressId);

    int insert(TbUserAddress record);

    int insertSelective(TbUserAddress record);

    TbUserAddress selectByPrimaryKey(Integer addressId);

    int updateByPrimaryKeySelective(TbUserAddress record);

    int updateByPrimaryKey(TbUserAddress record);
    
    List<TbUserAddress> getAddressList(@Param("userId") Integer userId);
    
    void setAllNotDefault(@Param("userId") Integer userId);
}