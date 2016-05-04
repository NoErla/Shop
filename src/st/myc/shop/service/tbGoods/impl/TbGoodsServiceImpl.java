package st.myc.shop.service.tbGoods.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import st.myc.shop.dao.tbGoods.TbGoodsMapper;
import st.myc.shop.dao.tbGoodsType.TbGoodsTypeMapper;
import st.myc.shop.entity.TbGoods;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.entity.vo.TbGoodsVo;
import st.myc.shop.service.tbGoods.TbGoodsService;
import st.myc.shop.util.MediaUtils;

@Service
public class TbGoodsServiceImpl implements TbGoodsService{
	
	@Autowired
	private TbGoodsMapper tbGoodsMapper;
	
	@Autowired
	private TbGoodsTypeMapper tbGoodsTypeMapper;

	@Override
	public void addGoods(TbGoods goods,MultipartFile file) throws IOException {
		String image = "";
		if (file != null && !file.isEmpty()) {
			image = MediaUtils.saveImage(file, 600, 800);
		}
		goods.setImage(image);
		goods.setCreateTime(new Date());
		tbGoodsMapper.insertSelective(goods);
	}

	@Override
	public void deleteGoods(int goodsId) {
		tbGoodsMapper.deleteByPrimaryKey(goodsId);
	}

	@Override
	public void updateGoods(TbGoods goods) {
		tbGoodsMapper.updateByPrimaryKeySelective(goods);
	}

	@Override
	public TbGoodsVo getGoodsById(int goodsId) {
		TbGoodsVo vo = tbGoodsMapper.selectByPrimaryKey(goodsId);
		vo.setTypeEName(tbGoodsTypeMapper.selectByPrimaryKey(vo.getGoodsTypeId()).getEname());
		return vo;
	}

	@Override
	public Integer getCountByType(Integer typeId) {
		return tbGoodsMapper.getCountByType(typeId);
	}

	@Override
	public List<TbGoodsVo> getListByType(Integer typeId, int offset, int rows) {
		List<TbGoodsVo> list = tbGoodsMapper.getListByType(typeId, offset, rows);
		for(TbGoodsVo vo : list){
			vo.setTypeEName(tbGoodsTypeMapper.selectByPrimaryKey(vo.getGoodsTypeId()).getEname());
		}
		return list;
	}

	@Override
	public PageVo<TbGoodsVo> getPageByType(Integer typeId, int pageNum) {
		PageVo<TbGoodsVo> pageVo = new PageVo<TbGoodsVo>(pageNum);
		pageVo.setRows(9);
		List<TbGoodsVo> list = 
				this.getListByType(typeId, pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getCountByType(typeId));
		return pageVo;
	}

	@Override
	public List<TbGoodsVo> getNewestList() {
		List<TbGoodsVo> list = tbGoodsMapper.getNewestList();
		for(TbGoodsVo vo : list){
			vo.setTypeEName(tbGoodsTypeMapper.selectByPrimaryKey(vo.getGoodsTypeId()).getEname());
		}
		return list;
	}

}
