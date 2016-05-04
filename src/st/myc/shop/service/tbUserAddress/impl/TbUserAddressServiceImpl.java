package st.myc.shop.service.tbUserAddress.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.dao.tbUserAddress.TbUserAddressMapper;
import st.myc.shop.entity.TbUserAddress;
import st.myc.shop.service.tbUserAddress.TbUserAddressService;
import st.myc.shop.util.SSUtils;

@Service
public class TbUserAddressServiceImpl implements TbUserAddressService{
	
	@Autowired
	private TbUserAddressMapper tbUserAddressMapper;

	@Override
	public void addAddress(TbUserAddress tbUserAddress) {
		if(tbUserAddress.getIsDefault() != null){
			if(tbUserAddress.getIsDefault() == 1){
				tbUserAddressMapper.setAllNotDefault(tbUserAddress.getUserId());				
			}
		}
		tbUserAddress.setAddress(SSUtils.toText(tbUserAddress.getAddress()));
		tbUserAddressMapper.insertSelective(tbUserAddress);
		
	}

	@Override
	public void deleteAddress(Integer id) {
		tbUserAddressMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public void updateAddress(TbUserAddress tbUserAddress) {
		if(tbUserAddress.getIsDefault() != null){
			if(tbUserAddress.getIsDefault() == 1){
				tbUserAddressMapper.setAllNotDefault(tbUserAddress.getUserId());				
			}
		}
		tbUserAddress.setAddress(SSUtils.toText(tbUserAddress.getAddress()));
		tbUserAddressMapper.updateByPrimaryKeySelective(tbUserAddress);
	}

	@Override
	public List<TbUserAddress> getAddressList(Integer userId) {
		return tbUserAddressMapper.getAddressList(userId);
	}
	
	@Override
	public TbUserAddress getAddressById(Integer id) {
		return tbUserAddressMapper.selectByPrimaryKey(id);
	}

}
