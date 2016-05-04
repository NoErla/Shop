package st.myc.shop.service.tbShoppingCart.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.constant.SystemConstant;
import st.myc.shop.dao.tbGoods.TbGoodsMapper;
import st.myc.shop.dao.tbShoppingCart.TbShoppingcartMapper;
import st.myc.shop.entity.SysAppUser;
import st.myc.shop.entity.TbGoods;
import st.myc.shop.entity.TbShoppingcart;
import st.myc.shop.entity.vo.TbShoppingcartVo;
import st.myc.shop.service.tbShoppingCart.TbShoppingCartService;

@Service
public class TbShoppingCartServiceImpl implements TbShoppingCartService{

	@Autowired
	private TbShoppingcartMapper tbShoppingCartMapper;
	
	@Autowired
	private TbGoodsMapper tbGoodsMapper;
	
	@Override
	public void addGoodsToCart(TbShoppingcart tbShoppingcart) {
		List<TbShoppingcartVo> list = this.getShoppingCartList(tbShoppingcart.getUserId());
		for(TbShoppingcartVo sc : list){
			if(sc.getGoodsId() == tbShoppingcart.getGoodsId()){
				tbShoppingcart.setCount(tbShoppingcart.getCount() + sc.getCount());
				tbShoppingCartMapper.updateByPrimaryKeySelective(tbShoppingcart);
				return;
			}
		}
		tbShoppingCartMapper.insertSelective(tbShoppingcart);
		
	}
	
	@Override
	public void updateGoodsToCart(TbShoppingcart tbShoppingcart) {
		tbShoppingCartMapper.updateByPrimaryKeySelective(tbShoppingcart);
		
	}

	@Override
	public void deleteGoodsToCart(Integer id) {
		tbShoppingCartMapper.deleteByPrimaryKey(id);		
	}
	

	@Override
	public List<TbShoppingcartVo> getShoppingCartList(Integer userId) {
		List<TbShoppingcartVo> list = tbShoppingCartMapper.selectByUserId(userId);
		for(TbShoppingcartVo sc : list){
			TbGoods goods = tbGoodsMapper.selectByPrimaryKey(sc.getGoodsId());
			sc.setPrice(goods.getPrice());
			sc.setImage(goods.getImage());
			sc.setGoodsName(goods.getGoodsName());
		}
		return list;
	}
	
	@Override
	public TbShoppingcartVo getShoppingCart(Integer id) {
		TbShoppingcartVo sc = tbShoppingCartMapper.selectByPrimaryKey(id);
		TbGoods goods = tbGoodsMapper.selectByPrimaryKey(sc.getGoodsId());
		sc.setPrice(goods.getPrice());
		sc.setImage(goods.getImage());
		sc.setGoodsName(goods.getGoodsName());
		return sc;
	}
	
	public void updateShoppingCartSession(HttpServletRequest request){
		SysAppUser user = (SysAppUser) request.getSession().getAttribute(SystemConstant.SESSION_USER);
		request.getSession().setAttribute("shoppingcart", this.getShoppingCartList(user.getUserId()));
	}

	

}
