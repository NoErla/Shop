package st.myc.shop.entity.vo;

import java.util.List;

import st.myc.shop.entity.TbOrder;
import st.myc.shop.entity.TbOrderDetail;

public class TbOrderVo extends TbOrder{
	
	private List<TbOrderDetailVo> orderDetailList;

	public List<TbOrderDetailVo> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<TbOrderDetailVo> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	
	
	
	
}
