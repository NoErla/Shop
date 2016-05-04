package st.myc.shop.dao.tbGoodsType;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.TbGoodsType;
import st.myc.shop.entity.TbGoodsTypeExample;
import st.myc.shop.entity.vo.TbGoodsTypeVo;

@Repository
public interface TbGoodsTypeMapper {
    int countByExample(TbGoodsTypeExample example);

    int deleteByExample(TbGoodsTypeExample example);

    int deleteByPrimaryKey(Integer goodsTypeId);

    int insert(TbGoodsType record);

    int insertSelective(TbGoodsType record);

    List<TbGoodsTypeVo> selectByExample(TbGoodsTypeExample example);

    TbGoodsTypeVo selectByPrimaryKey(Integer goodsTypeId);

    int updateByExampleSelective(@Param("record") TbGoodsType record, @Param("example") TbGoodsTypeExample example);

    int updateByExample(@Param("record") TbGoodsType record, @Param("example") TbGoodsTypeExample example);

    int updateByPrimaryKeySelective(TbGoodsType record);

    int updateByPrimaryKey(TbGoodsType record);
    
    List<TbGoodsTypeVo> selectSubType(@Param("parentId")Integer parentId);
    
    TbGoodsTypeVo selectByEname(@Param("ename")String ename);
}