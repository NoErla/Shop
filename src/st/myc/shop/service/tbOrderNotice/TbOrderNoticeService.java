package st.myc.shop.service.tbOrderNotice;

import java.util.List;

import st.myc.shop.entity.TbOrderNotice;

public interface TbOrderNoticeService {
	
	//根据主键查询
	public TbOrderNotice getById(Integer noticeId);
	
	//根据orderId查询 
	public List<TbOrderNotice> getListByOrderId(Integer orderId);

}
