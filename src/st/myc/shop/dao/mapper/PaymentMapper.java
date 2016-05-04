package st.myc.shop.dao.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import st.myc.shop.entity.Payment;
@Repository
public interface PaymentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Payment record);

    int insertSelective(Payment record);

    Payment selectByPrimaryKey(Integer id);
    
    Payment selectByOrderId(Integer orderId);

    int updateByPrimaryKeySelective(Payment record);

    int updateByPrimaryKeyWithBLOBs(Payment record);

    int updateByPrimaryKey(Payment record);
    
    int updateByOrderId(Payment record);
    
    List<Payment> selectListByOrderId(Integer orderId);
}