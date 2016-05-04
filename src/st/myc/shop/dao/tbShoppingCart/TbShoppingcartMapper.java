package st.myc.shop.dao.tbShoppingCart;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.TbShoppingcart;
import st.myc.shop.entity.vo.TbShoppingcartVo;

@Repository
public interface TbShoppingcartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbShoppingcart record);

    int insertSelective(TbShoppingcart record);

    TbShoppingcartVo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbShoppingcart record);

    int updateByPrimaryKey(TbShoppingcart record);
    
	List<TbShoppingcartVo> selectByUserId(@Param("userId") Integer userId);
	
	int deleteByUserIdAndGoodsId(@Param("userId") Integer userId,@Param("goodsId") Integer goodsId);
}