package st.myc.shop.service.tbOrderDetail.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.dao.tbOrderDetail.TbOrderDetailMapper;
import st.myc.shop.entity.TbGoods;
import st.myc.shop.entity.TbOrderDetail;
import st.myc.shop.entity.vo.TbOrderDetailVo;
import st.myc.shop.service.tbGoods.impl.TbGoodsServiceImpl;
import st.myc.shop.service.tbOrderDetail.TbOrderDetailService;

@Service
public class TbOrderDetailServiceImpl implements TbOrderDetailService{
	
	@Autowired
	private TbOrderDetailMapper tbOrderDetailMapper;
	
	@Autowired
	private TbGoodsServiceImpl tbGoodsService;

	@Override
	public void addOrderDetail(TbOrderDetail orderDetail) {
		tbOrderDetailMapper.insertSelective(orderDetail);
	}

	@Override
	public void updateOrderDetail(TbOrderDetail orderDetail) {
		tbOrderDetailMapper.updateByPrimaryKeySelective(orderDetail);
	}

	@Override
	public List<TbOrderDetailVo> getVoByOrderId(Integer orderId) {
		List<TbOrderDetailVo> list = tbOrderDetailMapper.getVoByOrderId(orderId);
		for(TbOrderDetailVo vo : list){
			TbGoods goods = tbGoodsService.getGoodsById(vo.getGoodsId());
			vo.setGoodsName(goods.getGoodsName());
			vo.setGoodsImage(goods.getImage());
		}
		return list;
	}

	public void insertSelective(TbOrderDetail orderDetail) {
		tbOrderDetailMapper.insertSelective(orderDetail);
	}

}
