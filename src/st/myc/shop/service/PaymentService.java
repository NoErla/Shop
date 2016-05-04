package st.myc.shop.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.dao.mapper.PaymentMapper;
import st.myc.shop.entity.Payment;

@Service
public class PaymentService {
	@Autowired
	public PaymentMapper paymentMapper;
	/**
	 * 添加payment
	 */
	public int addPayment(Payment payment){
		paymentMapper.insert(payment);
		return payment.getId();
	}
	
	/**
	 * 根据orderId更新payment
	 */

	public void updatePaymentByOrderId(Payment payment){
		paymentMapper.updateByOrderId(payment);
		
	}
	
	/**
	 * 根据主键更新payment
	 */
	public void updatePaymentById(Payment payment){
		paymentMapper.updateByPrimaryKey(payment);
	}
	
	public void updatePayment(String noticeSn,Date payTime,String outerNoticeSn,boolean isPaid,int orderId){
		Payment payment = new Payment();
		payment.setIsPaid(isPaid);
		payment.setNoticeSn(noticeSn);
		payment.setOuterNoticeSn(outerNoticeSn);
		payment.setOrderId(orderId);
		payment.setPayTime(payTime);
		paymentMapper.updateByOrderId(payment);
		
	}
	
	/**
	 * 根据orderId查找payment
	 */
	public Payment getPaymentByOrderId(int orderId){
		return paymentMapper.selectByOrderId(orderId);
	}
	
	/**
	 * 根据orderId查找paymentList
	 */
	public List<Payment> getPaymentListByOrderId(int orderId){
		return paymentMapper.selectListByOrderId(orderId);
	}
	
	/**
	 * 根据Id查找payment
	 */
	public Payment getPaymentById(int id){
		return paymentMapper.selectByPrimaryKey(id);
	}
	
	
}
