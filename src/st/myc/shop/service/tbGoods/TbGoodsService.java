package st.myc.shop.service.tbGoods;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import st.myc.shop.entity.TbGoods;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.entity.vo.TbGoodsVo;

public interface TbGoodsService {
	
	//添加商品
	public void addGoods(TbGoods goods,MultipartFile file) throws IOException;
	
	//删除商品
	public void deleteGoods(int goodsId);
	
	//更新商品信息
	public void updateGoods(TbGoods goods);
	
	//通过id获得商品信息
	public TbGoodsVo getGoodsById(int goodsId);
	
	//某类商品的总数
	public Integer getCountByType(Integer typeId);
	
	//某类商品的列表
	public List<TbGoodsVo> getListByType(Integer typeId, int offset,int rows);
	
	//某类商品的分页
	public PageVo<TbGoodsVo> getPageByType(Integer typeId,int pageNum);
	
	//最新的前十个货物
	public List<TbGoodsVo> getNewestList();
}
