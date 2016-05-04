package st.myc.shop.service.tbOrderNotice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.dao.tbOrderNotice.TbOrderNoticeMapper;
import st.myc.shop.entity.TbOrderNotice;
import st.myc.shop.service.tbOrderNotice.TbOrderNoticeService;

@Service
public class TbOrderNoticeServiceImpl implements TbOrderNoticeService{
	
	@Autowired
	private TbOrderNoticeMapper tbOrderNoticeMapper;

	@Override
	public TbOrderNotice getById(Integer noticeId) {
		return tbOrderNoticeMapper.selectByPrimaryKey(noticeId);
	}

	@Override
	public List<TbOrderNotice> getListByOrderId(Integer orderId) {
		return tbOrderNoticeMapper.selectByOrderId(orderId);
	}

}
