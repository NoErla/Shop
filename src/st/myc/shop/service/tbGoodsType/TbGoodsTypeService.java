package st.myc.shop.service.tbGoodsType;

import java.util.List;

import st.myc.shop.entity.TbGoodsType;
import st.myc.shop.entity.vo.TbGoodsTypeVo;

public interface TbGoodsTypeService {
	
	//添加商品种类
	public void addGoodsType(TbGoodsType goodsType);
	
	//删除商品种类
	public void deleteGoodsType(int goodsTypeId);
	
	//更新商品种类
	public void updateGoodsType(TbGoodsType goodsType);
	
	//通过id获得指定商品种类信息
	public TbGoodsTypeVo getTbGoodsTypeById(int goodsTypeId);
	
	//通过ename获得指定商品种类信息
	public TbGoodsTypeVo getTbGoodsTypeByEname(String ename);
	
	//获得列表
	public List<TbGoodsTypeVo> getAllList();
	
	//获得子类的列表
	public List<TbGoodsTypeVo> getSubType(Integer parentId);
	
	//获得填充了子类的列表
	public List<TbGoodsTypeVo> getAllType(Integer typeId);
	
	
}
