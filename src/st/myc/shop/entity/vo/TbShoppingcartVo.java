package st.myc.shop.entity.vo;

import st.myc.shop.entity.TbShoppingcart;

public class TbShoppingcartVo extends TbShoppingcart {
	
    private Double price;
    
    private String image;
    
    private String goodsName;

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
    
    
}