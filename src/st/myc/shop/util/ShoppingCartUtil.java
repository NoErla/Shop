package st.myc.shop.util;

import java.util.List;

import st.myc.shop.entity.vo.TbShoppingcartVo;

/** 
 * 日期处理
 */
public class ShoppingCartUtil {
	
	
	public static String getShoppingCartHTML(List<TbShoppingcartVo> list){
		Double sum  = 0.0;
        StringBuilder sb = new StringBuilder();
        sb.append("<div class='cart-info'>");
        sb.append("<a href='javascript:void(0);' class='cart-info-count'>");
        sb.append(list.size() + "个物品</a>");
        sb.append("</div>");
        sb.append("<i class='fa fa-shopping-cart'></i>");
        sb.append("<div class='cart-content-wrapper'>");
        sb.append("<div class='cart-content'>");
        sb.append("<ul class='scroller' style='height: 250px;'>");
        
        for(TbShoppingcartVo sc : list){
        	
        	sb.append("<li>");
        	sb.append("<a href='item.html'>");
        	sb.append("<img src='/shop/" + sc.getImage() + "' alt='Rolex Classic Watch' width='37' height='34'></a>");
        	sb.append("<span class='cart-content-count'>x " + sc.getCount() + "</span>");
        	sb.append("<strong><a href='item.html'>" + sc.getGoodsName() + "</a></strong>");
        	sum = sum + sc.getPrice() * sc.getCount();
        	sb.append("<em>￥" + sc.getPrice() * sc.getCount() + "</em>");
        	sb.append("<a onclick='deleteShoppingCart(" + sc.getGoodsId() + ");' class='del-goods'>");
        	sb.append("<i class='fa fa-times'></i></a>");
        	sb.append("</li> ");  	
        }
        sb.append("</ul>");
        sb.append("<div class='text-right'>");
        sb.append("<a href='javascript:void(0);' class='cart-info-value'>合计：￥" + sum +"</a>");
        sb.append("<a href='/shop/shoppingcart/show.htm' class='btn btn-default'>查看</a>");
        sb.append("<a href='/shop/checkout.htm' class='btn btn-primary'>结算</a>");
        sb.append("</div>");
        sb.append("</div>");
        sb.append("</div>");

		
		return sb.toString();
		
		
	}
	
	public static String getShoppingCartTrHTML(List<TbShoppingcartVo> list){
		Double sum  = 0.0;
		StringBuilder sb = new StringBuilder();
		sb.append("<div class='table-wrapper-responsive'>");
		sb.append("<table summary='Shopping cart'>");
		sb.append("<tr>");
		sb.append("<th></th>");
		sb.append("<th class='shopping-cart-image'>图片</th>");
		sb.append("<th class='shopping-cart-description'>商品名</th>");
		sb.append("<th class='shopping-cart-quantity'>数目</th>");
		sb.append("<th class='shopping-cart-price'>单价</th>");
		sb.append("<th class='shopping-cart-total' colspan='2'>总计</th>");
		sb.append("</tr>");	
		
		for(TbShoppingcartVo sc : list){
			sb.append("<tr>");
			sb.append("<td>");
			sb.append("<div style='text-align:center'>");
			sb.append("<input type='checkbox' name='wantToBuy' value='" + sc.getId() + "'>");
			sb.append("</div>");
			sb.append("</td>");
			sb.append("<td class='shopping-cart-image'>");
			sb.append("<a href='#'><img src='/shop/" + sc.getImage() +"' alt='"+ sc.getGoodsName() +"'></a>");
			sb.append("</td>");
			sb.append("<td class='shopping-cart-description'>");
			sb.append("<h3><a href='#'>" + sc.getGoodsName() +"</a></h3>");
			sb.append("</td>");
			sb.append("<td class='shopping-cart-quantity'>");
			sb.append("<div class='product-quantity1'>");
			sb.append("<input id='count" + sc.getId() + "' type='number' onchange='updateCartTr(" + sc.getId() +");' value='" + sc.getCount() + "' class='form-control input-sm' min='1'> ");
			sb.append("</div></td>");
			sb.append("<td class='shopping-cart-price'>");
			sb.append("<strong><span>￥</span>" + sc.getPrice() + "</strong>");
			sb.append("</td>");
			sb.append("<td class='shopping-cart-total'>");
			sb.append("<strong><span>￥</span>" + sc.getPrice() * sc.getCount() + "</strong>");
			sb.append("</td>");
			sum = sum + sc.getPrice() * sc.getCount();
			sb.append("<td class='del-goods-col'>");
			sb.append("<a class='del-goods' href='#' onclick='deleteCart(" + sc.getGoodsId() + ");'><i class='fa fa-times'></i></a>");
			sb.append("</td>");
			sb.append("</tr>");
		}
		
		sb.append("</table>");
		sb.append("</div>");
		sb.append("<div class='shopping-total'>");
		sb.append("<ul><li>");
		sb.append("<em>合计</em>");
		sb.append("<strong class='price'><span>￥</span>" + sum +"</strong>");
		sb.append("</li></ul>");
		
		
		return sb.toString();
		
	}

}
