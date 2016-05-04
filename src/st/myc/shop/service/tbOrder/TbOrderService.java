package st.myc.shop.service.tbOrder;

import java.util.List;

import st.myc.shop.entity.TbOrder;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.entity.vo.TbOrderVo;


public interface TbOrderService {
	
	//添加
	public void addOrder(TbOrder order);
	
	//添加
	public Integer addOrder(Integer userId,Integer addressRadios,Integer[] cartId) throws Exception;
	
	//删除
	public void deleteOrder(Integer id);
	
	//修改
	public void updateOrder(TbOrder order);
	
	//根据用户id取得列表
	public List<TbOrderVo> getVoByUserId(Integer userId);
	
	//根据主键查询
	public TbOrder getById(Integer orderId);

	public PageVo<TbOrderVo> getDynamicPage(TbOrder order, Integer pageNum);
	
	
	
}
