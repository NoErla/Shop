package st.myc.shop.service.tbGoodsType.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.dao.tbGoodsType.TbGoodsTypeMapper;
import st.myc.shop.entity.TbGoodsType;
import st.myc.shop.entity.TbGoodsTypeExample;
import st.myc.shop.entity.vo.TbGoodsTypeVo;
import st.myc.shop.service.tbGoodsType.TbGoodsTypeService;

@Service
public class TbGoodsTypeServiceImpl implements TbGoodsTypeService{
	
	@Autowired
	private TbGoodsTypeMapper tbGoodsTypeMapper;

	@Override
	public void addGoodsType(TbGoodsType goodsType) {
		tbGoodsTypeMapper.insertSelective(goodsType);
	}

	@Override
	public void deleteGoodsType(int goodsTypeId) {
		tbGoodsTypeMapper.deleteByPrimaryKey(goodsTypeId);
	}

	@Override
	public void updateGoodsType(TbGoodsType goodsType) {
		tbGoodsTypeMapper.updateByPrimaryKeySelective(goodsType);
	}

	@Override
	public TbGoodsTypeVo getTbGoodsTypeById(int goodsTypeId) {
		return tbGoodsTypeMapper.selectByPrimaryKey(goodsTypeId);
	}

	
	@Override
	public List<TbGoodsTypeVo> getAllList() {
		return tbGoodsTypeMapper.selectByExample(null);
	}

	@Override
	public List<TbGoodsTypeVo> getSubType(Integer parentId) {
		return tbGoodsTypeMapper.selectSubType(parentId);
	}

	@Override
	public List<TbGoodsTypeVo> getAllType(Integer typeId) {
		List<TbGoodsTypeVo> typeList = this.getSubType(typeId);
		for(TbGoodsTypeVo type : typeList){
			type.setSubType(this.getAllType(type.getGoodsTypeId()));
			if(type.getSubType().size() != 0){
				type.setHasSubType(true);
			}
		}
		return typeList;
	}

	@Override
	public TbGoodsTypeVo getTbGoodsTypeByEname(String ename) {
		return tbGoodsTypeMapper.selectByEname(ename);
	}



}
