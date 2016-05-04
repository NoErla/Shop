package st.myc.shop.service.tbShoppingCart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import st.myc.shop.entity.TbShoppingcart;
import st.myc.shop.entity.vo.TbShoppingcartVo;


public interface TbShoppingCartService {
	
	//往某用户的购物车中添加商品
	public void addGoodsToCart(TbShoppingcart tbShoppingcart);
	
	//根据主键移除商品
	public void deleteGoodsToCart(Integer id);
	
	
	//获取某用户的购物车中的商品
	public List<TbShoppingcartVo> getShoppingCartList(Integer userId);
	
	public void updateShoppingCartSession(HttpServletRequest request);

	public void updateGoodsToCart(TbShoppingcart tbShoppingcart);

	public TbShoppingcartVo getShoppingCart(Integer id);
	
}
