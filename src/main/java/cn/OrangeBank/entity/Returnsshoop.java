package cn.OrangeBank.entity;


public class Returnsshoop {

  private long returnsshoop_id;
  private long returnsshoop_count;
  private String returnsshoop_orderid;

  private Shoopping shop;

  public Shoopping getShop() {
    return shop;
  }

  public void setShop(Shoopping shop) {
    this.shop = shop;
  }

  public long getReturnsshoop_id() {
    return returnsshoop_id;
  }

  public void setReturnsshoop_id(long returnsshoop_id) {
    this.returnsshoop_id = returnsshoop_id;
  }

  public long getReturnsshoop_count() {
    return returnsshoop_count;
  }

  public void setReturnsshoop_count(long returnsshoop_count) {
    this.returnsshoop_count = returnsshoop_count;
  }

  public String getReturnsshoop_orderid() {
    return returnsshoop_orderid;
  }

  public void setReturnsshoop_orderid(String returnsshoop_orderid) {
    this.returnsshoop_orderid = returnsshoop_orderid;
  }
}
