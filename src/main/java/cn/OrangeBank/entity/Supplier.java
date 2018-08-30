package cn.OrangeBank.entity;


import java.util.Date;

public class Supplier {

  private long supplier_id;
  private String supplier_name;
  private String supplier_contact;
  private String supplier_phone;
  private long supplier_static;
  private Date supplier_cooperationtime;

  public String getSupplier_contact() {
    return supplier_contact;
  }

  public void setSupplier_contact(String supplier_contact) {
    this.supplier_contact = supplier_contact;
  }

  public String getSupplier_phone() {
    return supplier_phone;
  }

  public void setSupplier_phone(String supplier_phone) {
    this.supplier_phone = supplier_phone;
  }

  public long getSupplier_static() {
    return supplier_static;
  }

  public void setSupplier_static(long supplier_static) {
    this.supplier_static = supplier_static;
  }

  public long getSupplier_id() {
    return supplier_id;
  }

  public void setSupplier_id(long supplier_id) {
    this.supplier_id = supplier_id;
  }

  public String getSupplier_name() {
    return supplier_name;
  }

  public void setSupplier_name(String supplier_name) {
    this.supplier_name = supplier_name;
  }

  public Date getSupplier_cooperationtime() {
    return supplier_cooperationtime;
  }

  public void setSupplier_cooperationtime(Date supplier_cooperationtime) {
    this.supplier_cooperationtime = supplier_cooperationtime;
  }
}
