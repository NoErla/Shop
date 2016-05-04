package st.myc.shop.dao.sysUser;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.SysUser;
import st.myc.shop.entity.SysUserExample;

@Repository
public interface SysUserMapper {
    int countByExample(SysUserExample example);

    int deleteByExample(SysUserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    List<SysUser> selectByExample(SysUserExample example);
    
    //获得总列表
    List<SysUser> getAllList(@Param("offset") int offset,@Param("rows") int rows);

    List<SysUser> getSearchList(
    		@Param("keywords") String keywords, 
    		@Param("lastLoginStart") String lastLoginStart,
    		@Param("lastLoginEnd") String lastLoginEnd, 
    		@Param("offset") int offset,@Param("rows") int rows);
    
    SysUser selectByPrimaryKey(Integer userId);
    
    SysUser selectByUserName(String userName);
    
    //获得总人数
    int countAll();

    int updateByExampleSelective(@Param("record") SysUser record, @Param("example") SysUserExample example);

    int updateByExample(@Param("record") SysUser record, @Param("example") SysUserExample example);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

}