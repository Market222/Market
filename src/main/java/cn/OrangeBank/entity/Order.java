package cn.OrangeBank.entity;

import java.util.Date;

public class Order {
    private String order_id;//订单编号
    private String order_state;//发送状态
    private Date order_sendtime;//发送时间
    private String order_stateConfirmation;//确认状态
    private Date order_confirmedTime; //确认时间
    private String order_objection;//拒绝理由
    private String order_isship;//供应商未发货' COMMENT'发货状态
    private Date order_shiptime;//发货时间
    private Integer order_stockcommodityid;//进货商品表id


    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getOrder_state() {
        return order_state;
    }

    public void setOrder_state(String order_state) {
        this.order_state = order_state;
    }

    public Date getOrder_sendtime() {
        return order_sendtime;
    }

    public void setOrder_sendtime(Date order_sendtime) {
        this.order_sendtime = order_sendtime;
    }

    public String getOrder_stateConfirmation() {
        return order_stateConfirmation;
    }

    public void setOrder_stateConfirmation(String order_stateConfirmation) {
        this.order_stateConfirmation = order_stateConfirmation;
    }

    public Date getOrder_confirmedTime() {
        return order_confirmedTime;
    }

    public void setOrder_confirmedTime(Date order_confirmedTime) {
        this.order_confirmedTime = order_confirmedTime;
    }

    public String getOrder_objection() {
        return order_objection;
    }

    public void setOrder_objection(String order_objection) {
        this.order_objection = order_objection;
    }

    public String getOrder_isship() {
        return order_isship;
    }

    public void setOrder_isship(String order_isship) {
        this.order_isship = order_isship;
    }

    public Date getOrder_shiptime() {
        return order_shiptime;
    }

    public void setOrder_shiptime(Date order_shiptime) {
        this.order_shiptime = order_shiptime;
    }

    public Integer getOrder_stockcommodityid() {
        return order_stockcommodityid;
    }

    public void setOrder_stockcommodityid(Integer order_stockcommodityid) {
        this.order_stockcommodityid = order_stockcommodityid;
    }
}

