package st.myc.shop.service.tbOrderDetail;

import java.util.List;

import st.myc.shop.entity.TbOrderDetail;
import st.myc.shop.entity.vo.TbOrderDetailVo;



public interface TbOrderDetailService {
	
	//添加
	public void addOrderDetail(TbOrderDetail orderDetail);

	//修改
	public void updateOrderDetail(TbOrderDetail orderDetail);
	
	//根据orderId得到List
	public List<TbOrderDetailVo> getVoByOrderId(Integer orderId);
	
	
	
}
