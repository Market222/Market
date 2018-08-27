package cn.OrangeBank.entity;

import java.util.Date;

public class MarketBack {
    private String marketBack_id;//销售ID
    private String  marketBack_odd;//销售单号
    private Integer marketBack_count;//商品数量
    private Integer marketBack_clientId;//客户id
    private String marketBack_address;//送货地址
    private String marketBack_salesman;//销售员
    private String marketBack_preparedby;//制单人
    private Date marketBack_prepareddate;//制单日期
    private String marketBack_remark;//备注

    public Integer getMarketBack_count() {
        return marketBack_count;
    }

    public void setMarketBack_count(Integer marketBack_count) {
        this.marketBack_count = marketBack_count;
    }

    public String getMarketBack_id() {
        return marketBack_id;
    }

    public void setMarketBack_id(String marketBack_id) {
        this.marketBack_id = marketBack_id;
    }

    public String getMarketBack_odd() {
        return marketBack_odd;
    }

    public void setMarketBack_odd(String marketBack_odd) {
        this.marketBack_odd = marketBack_odd;
    }

    public Integer getMarketBack_clientId() {
        return marketBack_clientId;
    }

    public void setMarketBack_clientId(Integer marketBack_clientId) {
        this.marketBack_clientId = marketBack_clientId;
    }

    public String getMarketBack_address() {
        return marketBack_address;
    }

    public void setMarketBack_address(String marketBack_address) {
        this.marketBack_address = marketBack_address;
    }

    public String getMarketBack_salesman() {
        return marketBack_salesman;
    }

    public void setMarketBack_salesman(String marketBack_salesman) {
        this.marketBack_salesman = marketBack_salesman;
    }

    public String getMarketBack_preparedby() {
        return marketBack_preparedby;
    }

    public void setMarketBack_preparedby(String marketBack_preparedby) {
        this.marketBack_preparedby = marketBack_preparedby;
    }

    public Date getMarketBack_prepareddate() {
        return marketBack_prepareddate;
    }

    public void setMarketBack_prepareddate(Date marketBack_prepareddate) {
        this.marketBack_prepareddate = marketBack_prepareddate;
    }

    public String getMarketBack_remark() {
        return marketBack_remark;
    }

    public void setMarketBack_remark(String marketBack_remark) {
        this.marketBack_remark = marketBack_remark;
    }
}
