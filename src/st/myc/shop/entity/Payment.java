package st.myc.shop.entity;

import java.util.Date;

public class Payment {
    private Integer id;

    private String noticeSn;

    private Date createTime;

    private Date payTime;

    private Integer orderId;

    private Boolean isPaid;

    private Integer userId;

    private Integer paymentId;

    private Double money;

    private String outerNoticeSn;

    private String memo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Boolean getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(Boolean isPaid) {
        this.isPaid = isPaid;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
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

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }
}