package st.myc.shop.dao.sysAppUser;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.SysAppUser;
import st.myc.shop.entity.SysAppUserExample;

@Repository
public interface SysAppUserMapper {
    int countByExample(SysAppUserExample example);

    int deleteByExample(SysAppUserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(SysAppUser record);

    int insertSelective(SysAppUser record);

    List<SysAppUser> selectByExample(SysAppUserExample example);

    //获得总列表
    List<SysAppUser> getAllList(@Param("offset") int offset,@Param("rows") int rows);

    List<SysAppUser> getSearchList(
    		@Param("keywords") String keywords, 
    		@Param("lastLoginStart") String lastLoginStart,
    		@Param("lastLoginEnd") String lastLoginEnd, 
    		@Param("offset") int offset,@Param("rows") int rows);
    
    SysAppUser selectByPrimaryKey(Integer userId);
    
    SysAppUser selectByUserName(String userName);
    
    //获得总人数
    int countAll();

    int updateByExampleSelective(@Param("record") SysAppUser record, @Param("example") SysAppUserExample example);

    int updateByExample(@Param("record") SysAppUser record, @Param("example") SysAppUserExample example);

    int updateByPrimaryKeySelective(SysAppUser record);

    int updateByPrimaryKey(SysAppUser record);
}