package st.myc.shop.entity.vo;

import java.util.List;

import st.myc.shop.entity.SysMenu;
import st.myc.shop.entity.TbGoodsType;

/**
 * 商品类型VO
 * 
 */
public class TbGoodsTypeVo extends TbGoodsType{
	private String target;
	private SysMenu parentType;
	private List<TbGoodsTypeVo> subType;
	private boolean hasSubType = false;
	
	
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public SysMenu getParentType() {
		return parentType;
	}
	public void setParentType(SysMenu parentType) {
		this.parentType = parentType;
	}
	public List<TbGoodsTypeVo> getSubType() {
		return subType;
	}
	public void setSubType(List<TbGoodsTypeVo> subType) {
		this.subType = subType;
	}
	public boolean isHasSubType() {
		return hasSubType;
	}
	public void setHasSubType(boolean hasSubType) {
		this.hasSubType = hasSubType;
	}
	
	

}
