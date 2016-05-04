package st.myc.shop.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.AuthenticationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import st.myc.shop.config.UnionpayConfig;
import st.myc.shop.constant.OrderStatusConstant;
import st.myc.shop.constant.PayStatusConstant;
import st.myc.shop.constant.PaymentConstant;
import st.myc.shop.dao.mapper.DealMapper;
import st.myc.shop.dao.mapper.PaymentMapper;
import st.myc.shop.entity.Deal;
import st.myc.shop.entity.Payment;
import st.myc.shop.entity.vo.DealVo;
import st.myc.shop.entity.vo.JsonVo;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.util.MoneyUtils;
import st.unionpay.acp.sdk.AcpService;
import st.unionpay.acp.sdk.DemoBase;
import st.unionpay.acp.sdk.SDKConfig;
/**
 * 订单service
 * 
 * @author Administrator
 * 
 */
@Service
public class DealService {
	@Autowired
	private DealMapper dealMapper;
	@Autowired
	private PaymentMapper paymentMapper;
	@Autowired
	private UnionpayConfig unionpayConfig ;

	
	/**
	 * 事物处理，订单信息添加进数据库
	 * @param deal
	 */
	@Transactional
	public void createDeal(Deal deal) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.isEmpty();
		
		dealMapper.insertFindId(deal);
		Payment payment = new Payment();
		payment.setPaymentId(deal.getPaymentId());
		payment.setCreateTime(new Date());
		// 获得userId
		payment.setUserId(deal.getUserId());
		// 获得金额
		payment.setMoney(deal.getPrice());
		//获得orderId
		payment.setOrderId(deal.getId());
		//获得支付状态：未支付
		payment.setIsPaid(PayStatusConstant.NOT_YET);
		paymentMapper.insert(payment);
	}

	

	/**
	 * 
	 * 更新支付时间
	 * 
	 * @param paymentId
	 * @param payTime
	 */
	public void updateDeal(int orderId, Date payTime) {
		Deal deal = new Deal();
		deal.setOrderStatus(OrderStatusConstant.ORDER_SUCCESS);
		deal.setPayTime(payTime);
		deal.setId(orderId);
		dealMapper.updateByPrimaryKeySelective(deal);
	}
	
	/**
	 * 
	 * 更新订单信息
	 * 
	 * @param paymentId
	 * @param payTime
	 */
	public void updateDealById(Deal deal) {
		dealMapper.updateByPrimaryKeySelective(deal);
	}
	
	/**
	 * 退款
	 * @param deal
	 */
	@Transactional
	public boolean refund(int orderId,JsonVo<Deal> json){
		Deal deal = dealMapper.selectByIdAndLockIt(orderId);
		if(deal.getOrderStatus() != OrderStatusConstant.ORDER_SUCCESS){
			json.setResult(false);
			return false;
		} else {
			Payment payment = paymentMapper.selectListByOrderId(orderId).get(0);
			String txnAmt = MoneyUtils.doubleToString(payment.getMoney());
			
			Map<String, String> data = new HashMap<String, String>();
			
			/***银联全渠道系统，产品参数，除了encoding自行选择外其他不需修改***/
			data.put("version", DemoBase.version);               //版本号
			data.put("encoding", DemoBase.encoding_UTF8);             //字符集编码 可以使用UTF-8,GBK两种方式
			data.put("signMethod", "01");                        //签名方法 目前只支持01-RSA方式证书加密
			data.put("txnType", "04");                           //交易类型 04-退货		
			data.put("txnSubType", "00");                        //交易子类型  默认00		
			data.put("bizType", "000201");                       //业务类型 B2C网关支付，手机wap支付	
			data.put("channelType", "07");                       //渠道类型，07-PC，08-手机		
			
			/**
			 * 插入订单信息
			 */
			Payment refund  = new Payment();
			int refundId;
			refund.setCreateTime(new Date());
			refund.setOrderId(orderId);
			refund.setIsPaid(PayStatusConstant.NOT_YET);
			refund.setPaymentId(PaymentConstant.PAYMENT_YL);
			refund.setMoney(0-payment.getMoney());
			refund.setUserId(payment.getUserId());
			if(paymentMapper.selectListByOrderId(orderId).size() == 1){
				paymentMapper.insert(refund);	
				refundId = refund.getId();
			} else {
				json.setResult(false);
				json.setMsg("订单重复");
				return true;
			}
			
			/***商户接入参数***/
			data.put("merId", unionpayConfig.getMerid());                //商户号码，请改成自己申请的商户号或者open上注册得来的777商户号测试
			data.put("accessType", "0");                         //接入类型，商户接入固定填0，不需修改		
			data.put("orderId", String.valueOf(refundId));          //商户订单号，8-40位数字字母，不能含“-”或“_”，可以自行定制规则，重新产生，不同于原消费	
			
			refund.setPayTime(new Date());
			data.put("txnTime", new SimpleDateFormat("yyyyMMddHHmmss").format(refund.getPayTime()));      //订单发送时间，格式为YYYYMMDDhhmmss，必须取当前时间，否则会报txnTime无效	
			
			data.put("currencyCode", "156");                     //交易币种（境内商户一般是156 人民币）		
			data.put("txnAmt", txnAmt);                          //****退货金额，单位分，不要带小数点。退货金额小于等于原消费金额，当小于的时候可以多次退货至退货累计金额等于原消费金额		
			data.put("reqReserved", "透传信息");                    //请求方保留域，透传字段（可以实现商户自定义参数的追踪）本交易的后台通知,对本交易的交易状态查询交易、对账文件中均会原样返回，商户可以按需上传，长度为1-1024个字节		
			data.put("backUrl", unionpayConfig.getBackUrl());               //后台通知地址，后台通知参数详见open.unionpay.com帮助中心 下载  产品接口规范  网关支付产品接口规范 退货交易 商户通知,其他说明同消费交易的后台通知
			
			/***要调通交易以下字段必须修改***/
			data.put("origQryId", payment.getOuterNoticeSn());      //****原消费交易返回的的queryId，可以从消费交易后台通知接口中或者交易状态查询接口中获取
			
			
			/**请求参数设置完毕，以下对请求参数进行签名并发送http post请求，接收同步应答报文------------->**/
			
			Map<String, String> submitFromData  = AcpService.sign(data,DemoBase.encoding_UTF8);//报文中certId,signature的值是在signData方法中获取并自动赋值的，只要证书配置正确即可。

			String url = SDKConfig.getConfig().getBackRequestUrl();//交易请求url从配置文件读取对应属性文件acp_sdk.properties中的 acpsdk.backTransUrl
			
			//如果这里通讯读超时（30秒），需发起交易状态查询交易
			Map<String, String> resmap = AcpService.sign(null,null);//这里调用signData之后，调用submitUrl之前不能对submitFromData中的键值对做任何修改，如果修改会导致验签不通过
			
			/**对应答码的处理，请根据您的业务逻辑来编写程序,以下应答码处理逻辑仅供参考------------->**/
			
			//应答码规范参考open.unionpay.com帮助中心 下载  产品接口规范  《平台接入接口规范-第5部分-附录》
			if(resmap.get("respCode").equals("00")){
				//交易已受理，等待接收后台通知更新订单状态,也可以主动发起 查询交易确定交易状态。
				deal.setOrderStatus(OrderStatusConstant.ORDER_REFUNDING);
				dealMapper.updateByPrimaryKeySelective(deal);
				json.setResult(true);
				json.setMsg("银行已受理请求");
			}else if(resmap.get("respCode").equals("03") || 
					 resmap.get("respCode").equals("04") ||
					 resmap.get("respCode").equals("05")){
				//后续需发起交易状态查询交易确定交易状态
				json.setResult(false);
				json.setMsg("退款中");
				return true;
			}else{
				//其他应答码为失败请排查原因
				json.setResult(false);
				json.setMsg(resmap.get("respCode"));
				return true;
			}
			
			return true;
		}
	}
	
	/**
	 * 事物处理
	 * @param payment
	 * @param deal
	 */
	@Transactional
	public void updateDealAndPayment(Payment payment,Deal deal){
		paymentMapper.updateByPrimaryKeySelective(payment);
		dealMapper.updateByPrimaryKeySelective(deal);
	}


	/**
	 * 更改订单状态
	 */
	
	public void updateOrderStatus(int orderId,int orderStatus){
		Deal deal = new Deal();
		deal.setId(orderId);
		deal.setOrderStatus(orderStatus);
		dealMapper.updateByPrimaryKeySelective(deal);
		
	}
	
	/**
	 * 取消订单
	 */
	@Transactional
	public void cancelDeal(int orderId) throws AuthenticationException{
		Deal deal = dealMapper.selectByPrimaryKey(orderId);
		
		if(deal == null){
			throw new AuthenticationException("订单不存在");
		}
		
		
		deal.setIsShow(OrderStatusConstant.ORDER_NOT_SHOW);//已取消的订单
		dealMapper.updateByPrimaryKeySelective(deal);
		
	}
	
	/**
	 * 通过订单id获得用户需要支付的信息
	 * 
	 * @return
	 */
	public Deal getDealByOrderId(int id) {
		return dealMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 得到同一用户的订单
	 */
	
	public List<DealVo> getDealListByUserId(int userId){
		return dealMapper.selectByUserId(userId);
	}
	
	/**
	 * 得到某用户对某回报子项，未支付和已支付成功的订单数目
	 */
	
	public Integer getPaidAndCreateDealCountByUserIdAndProjectId(int userId,int projectPayoffId){
		return dealMapper.getPaidAndCreateDealCountByUserIdAndProjectId(userId, projectPayoffId);
	}
	
	
	/**
	 * 管理员得到订单
	 */
	public PageVo<DealVo> getManageDeal(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		int count = dealMapper.getDealCount(null);
		list = dealMapper.getDealListByPage(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	/**
	 * 管理员得到订单ByUser
	 */
	public PageVo<DealVo> getManageDealByUser(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		int count = dealMapper.getDealCount(null);
		list = dealMapper.getDealListByPageAndUser(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	/**
	 * 管理员得到订单ByMoney从大到小
	 */
	public PageVo<DealVo> getManageDealByMoneyDesc(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		int count = dealMapper.getDealCount(null);
		list = dealMapper.getDealListByPageAndMoneyDesc(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	/**
	 * 管理员得到订单ByMoney从小到大
	 */
	public PageVo<DealVo> getManageDealByMoneyAsc(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		int count = dealMapper.getDealCount(null);
		list = dealMapper.getDealListByPageAndMoneyAsc(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	/**
	 * 管理员得到订单ByMoney大于5000
	 */
	public PageVo<DealVo> getManageDealByMoneyFive(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		Deal deal = new Deal();
		deal.setPrice(5000.00);
		int count = dealMapper.getDealCount(deal);
		list = dealMapper.getDealListByPageAndMoneyFive(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	
	/**
	 * 管理员得到已支付订单
	 */
	public PageVo<DealVo> getManageDealSuccess(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		Deal deal = new Deal();
		deal.setOrderStatus(1);
		int count = dealMapper.getDealCount(deal);
		list = dealMapper.getDealListSuccess(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	/**
	 * 管理员得到未支付订单
	 */
	public PageVo<DealVo> getManageDealFail(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		Deal deal = new Deal();
		deal.setOrderStatus(0);
		int count = dealMapper.getDealCount(deal);
		list = dealMapper.getDealListFail(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	/**
	 * 管理员得到已取消订单
	 */
	public PageVo<DealVo> getManageDealDelete(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		Deal deal = new Deal();
		deal.setIsShow(OrderStatusConstant.ORDER_NOT_SHOW);
		int count = dealMapper.getDealCount(deal);
		list = dealMapper.getDealListDelete(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	/**
	 * 管理员得到退款中订单
	 */
	public PageVo<DealVo> getManageDealRefund(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		Deal deal = new Deal();
		deal.setOrderStatus(OrderStatusConstant.ORDER_REFUNDING);
		int count = dealMapper.getDealCount(deal);
		list = dealMapper.getDealListRefund(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}
	
	/**
	 * 管理员得到已退款订单
	 */
	public PageVo<DealVo> getManageDealRefundEd(int pageNum){
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		Deal deal = new Deal();
		deal.setOrderStatus(OrderStatusConstant.ORDER_REFUND);
		int count = dealMapper.getDealCount(deal);
		list = dealMapper.getDealListRefundEd(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

	public PageVo<DealVo> getManageDealByOrderId(int orderId,int pageNum) {
		PageVo<DealVo> pageVo = new PageVo<DealVo>(pageNum);
		pageVo.setRows(8);
		List<DealVo> list = new ArrayList<DealVo>();
		Deal deal = new Deal();
		deal.setId(orderId);
		int count = dealMapper.getDealCount(deal);
		list = dealMapper.getDealListByOrderId(orderId,pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

	public void updateOrderStatusByMemo(Deal deal) {
		deal.setOrderStatus(OrderStatusConstant.ORDER_REFUND);
		dealMapper.updateDealByMemo(deal);
		
	}
}
