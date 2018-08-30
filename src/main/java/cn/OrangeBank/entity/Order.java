package cn.OrangeBank.entity;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class Order {
    private String order_id;//订单编号
    private String order_state;//发送状态
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date order_sendtime;//发送时间
    private String order_stateConfirmation;//确认状态
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date order_confirmedTime; //确认时间
    private String order_objection;//拒绝理由
    private double order_countmoney; //总金额
    private String order_isship;//供应商未发货' COMMENT'发货状态
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date order_shiptime;//发货时间
    private String order_warehousestatus;
    private long order_usersid;
    private List<Stock> stocks=new ArrayList<Stock>();

    public String getOrder_warehousestatus() {
        return order_warehousestatus;
    }

    public void setOrder_warehousestatus(String order_warehousestatus) {
        this.order_warehousestatus = order_warehousestatus;
    }

    public long getOrder_usersid() {
        return order_usersid;
    }

    public void setOrder_usersid(long order_usersid) {
        this.order_usersid = order_usersid;
    }

    public void setOrder_countmoney(double order_countmoney) {
        this.order_countmoney = order_countmoney;
    }

    public List<Stock> getStocks() {
        return stocks;
    }

    public void setStocks(List<Stock> stocks) {
        this.stocks = stocks;
    }

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

    public Double getOrder_countmoney() {
        return order_countmoney;
    }

    public void setOrder_countmoney(Double order_countmoney) {
        this.order_countmoney = order_countmoney;
    }
}

