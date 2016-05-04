package st.myc.shop.entity;

import java.util.Date;

public class TbOrderNotice {
    private Integer noticeId;

    private String noticeSn;

    private Date createTime;

    private Date payTime;

    private Integer orderId;

    private Double money;

    private String outerNoticeSn;

    private Integer isPaid;

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeSn() {
        return noticeSn;
    }

    public void setNoticeSn(String noticeSn) {
        this.noticeSn = noticeSn == null ? null : noticeSn.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getOuterNoticeSn() {
        return outerNoticeSn;
    }

    public void setOuterNoticeSn(String outerNoticeSn) {
        this.outerNoticeSn = outerNoticeSn == null ? null : outerNoticeSn.trim();
    }

    public Integer getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(Integer isPaid) {
        this.isPaid = isPaid;
    }
}