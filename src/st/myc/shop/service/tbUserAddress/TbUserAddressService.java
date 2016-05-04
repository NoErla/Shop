package st.myc.shop.service.tbUserAddress;

import java.util.List;

import st.myc.shop.entity.TbUserAddress;


public interface TbUserAddressService {
	
	//添加地址
	public void addAddress(TbUserAddress tbUserAddress);
	
	//删除地址
	public void deleteAddress(Integer id);
	
	//修改地址
	public void updateAddress(TbUserAddress tbUserAddress);
	
	//获取某用户的所有地址
	public List<TbUserAddress> getAddressList(Integer userId);

	public TbUserAddress getAddressById(Integer id);
	
}
