package cn.OrangeBank.entity;
/**
 * 商品表
 */
public class Shoopping {
    private Integer shoopping_id;//商品id
    private String shoopping_name;//商品名称
    private String shoopping_describe;//商品描述
    private String shoopping_unit;//商品单位
    private Integer shoopping_count;//商品数量
    private double shoopping_stockmoney;//进货单价
    private double shoopping_marketmoney;//销货单价
    private Integer shoopping_sales;//销量
    private Integer shoopping_warehouseid;//仓库id


    public Integer getShoopping_sales() {
        return shoopping_sales;
    }

    public void setShoopping_sales(Integer shoopping_sales) {
        this.shoopping_sales = shoopping_sales;
    }

    public Integer getShoopping_id() {
        return shoopping_id;
    }

    public void setShoopping_id(Integer shoopping_id) {
        this.shoopping_id = shoopping_id;
    }

    public String getShoopping_name() {
        return shoopping_name;
    }

    public void setShoopping_name(String shoopping_name) {
        this.shoopping_name = shoopping_name;
    }

    public String getShoopping_describe() {
        return shoopping_describe;
    }

    public void setShoopping_describe(String shoopping_describe) {
        this.shoopping_describe = shoopping_describe;
    }

    public String getShoopping_unit() {
        return shoopping_unit;
    }

    public void setShoopping_unit(String shoopping_unit) {
        this.shoopping_unit = shoopping_unit;
    }

    public Integer getShoopping_count() {
        return shoopping_count;
    }

    public void setShoopping_count(Integer shoopping_count) {
        this.shoopping_count = shoopping_count;
    }

    public double getShoopping_stockmoney() {
        return shoopping_stockmoney;
    }

    public void setShoopping_stockmoney(double shoopping_stockmoney) {
        this.shoopping_stockmoney = shoopping_stockmoney;
    }

    public double getShoopping_marketmoney() {
        return shoopping_marketmoney;
    }

    public void setShoopping_marketmoney(double shoopping_marketmoney) {
        this.shoopping_marketmoney = shoopping_marketmoney;
    }

    public Integer getShoopping_warehouseid() {
        return shoopping_warehouseid;
    }

    public void setShoopping_warehouseid(Integer shoopping_warehouseid) {
        this.shoopping_warehouseid = shoopping_warehouseid;
    }

}
