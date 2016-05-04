package st.myc.shop.service.tbOrder.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import st.myc.shop.dao.tbGoods.TbGoodsMapper;
import st.myc.shop.dao.tbOrder.TbOrderMapper;
import st.myc.shop.entity.TbGoods;
import st.myc.shop.entity.TbOrder;
import st.myc.shop.entity.TbOrderDetail;
import st.myc.shop.entity.TbShoppingcart;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.entity.vo.TbOrderVo;
import st.myc.shop.service.tbOrder.TbOrderService;
import st.myc.shop.service.tbOrderDetail.impl.TbOrderDetailServiceImpl;
import st.myc.shop.service.tbShoppingCart.impl.TbShoppingCartServiceImpl;

@Service
public class TbOrderServiceImpl implements TbOrderService{
	
	@Autowired
	private TbOrderMapper tbOrderMapper;
	
	@Autowired
	private TbOrderDetailServiceImpl tbOrderDetailService;
	
	@Autowired
	private TbGoodsMapper tbGoodsMapper;
	
	@Autowired
	private TbShoppingCartServiceImpl tbShoppingCartService;

	@Override
	public void addOrder(TbOrder order) {
		tbOrderMapper.insertSelective(order);
	}
	
	@Override
	@Transactional
	public Integer addOrder(Integer userId,Integer addressRadios, Integer[] cartId) 
	throws Exception{	
		TbOrder order = new TbOrder();
		order.setAddressId(addressRadios);
		order.setUserId(userId);
		BigDecimal sum = new BigDecimal(0);
		for(int i=0;i<cartId.length;i++){
			TbShoppingcart sc = tbShoppingCartService.getShoppingCart(cartId[i]);
			TbGoods goods = tbGoodsMapper.selectByPrimaryKey(sc.getGoodsId());
			BigDecimal count = new BigDecimal(sc.getCount());
			BigDecimal price = new BigDecimal(goods.getPrice());
			sum = sum.add(count.multiply(price));		
		}
		Double sumDouble = sum.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		order.setTotalPrice(sumDouble);
		order.setCreateTime(new Date());
		tbOrderMapper.insertSelective(order);
		
		for(int i=0;i<cartId.length;i++){
			TbShoppingcart sc = tbShoppingCartService.getShoppingCart(cartId[i]);
			TbGoods goods = tbGoodsMapper.selectByPrimaryKey(sc.getGoodsId());
			TbOrderDetail orderDetail = new TbOrderDetail();
			orderDetail.setCount(sc.getCount());
			orderDetail.setGoodsId(sc.getGoodsId());
			orderDetail.setOrderId(order.getOrderId());
			orderDetail.setPrice(goods.getPrice());
			tbOrderDetailService.insertSelective(orderDetail);
		}	
		
		return order.getOrderId();
	}

	@Override
	public void deleteOrder(Integer id) {
		tbOrderMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateOrder(TbOrder order) {
		tbOrderMapper.updateByPrimaryKeySelective(order);
	}

	@Override
	public List<TbOrderVo> getVoByUserId(Integer userId) {
		List<TbOrderVo> list = tbOrderMapper.getVoByUserId(userId);
		for(TbOrderVo vo : list){
			vo.setOrderDetailList(tbOrderDetailService.getVoByOrderId(vo.getOrderId()));
		}
		return list;
	}

	@Override
	public TbOrder getById(Integer orderId) {
		return tbOrderMapper.selectByPrimaryKey(orderId);
	}

	@Override
	public PageVo<TbOrderVo> getDynamicPage(TbOrder order,Integer pageNum) {
		List<TbOrderVo> list = tbOrderMapper.getDynamicList(order);
		PageVo<TbOrderVo> pageVo = new PageVo<TbOrderVo>(pageNum);
		pageVo.setRows(20);
		pageVo.setList(list);
		pageVo.setCount(tbOrderMapper.getDynamicCount(order));
		return pageVo;
	}

	

}
