package st.myc.shop.entity.vo;

import st.myc.shop.entity.Deal;

public class DealVo extends Deal {
	private String username;
	
	private String orderDescript;

	public String getOrderDescript() {
		return orderDescript;
	}

	public void setOrderDescript(String orderDescript) {
		this.orderDescript = orderDescript;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
}
