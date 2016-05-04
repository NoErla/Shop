package st.myc.shop.dao.tbGoods;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.TbGoods;
import st.myc.shop.entity.TbGoodsExample;
import st.myc.shop.entity.vo.TbGoodsVo;

@Repository
public interface TbGoodsMapper {
    int countByExample(TbGoodsExample example);

    int deleteByExample(TbGoodsExample example);

    int deleteByPrimaryKey(Integer goodsId);

    int insert(TbGoods record);

    int insertSelective(TbGoods record);

    List<TbGoods> selectByExampleWithBLOBs(TbGoodsExample example);

    List<TbGoods> selectByExample(TbGoodsExample example);

    TbGoodsVo selectByPrimaryKey(Integer goodsId);

    int updateByExampleSelective(@Param("record") TbGoods record, @Param("example") TbGoodsExample example);

    int updateByExampleWithBLOBs(@Param("record") TbGoods record, @Param("example") TbGoodsExample example);

    int updateByExample(@Param("record") TbGoods record, @Param("example") TbGoodsExample example);

    int updateByPrimaryKeySelective(TbGoods record);

    int updateByPrimaryKeyWithBLOBs(TbGoods record);

    int updateByPrimaryKey(TbGoods record);
    
    Integer getCountByType(@Param("typeId") Integer typeId);
    
    List<TbGoodsVo> getListByType(@Param("typeId") Integer typeId, @Param("offset") int offset,@Param("rows") int rows);
    
    List<TbGoodsVo> getNewestList();
}