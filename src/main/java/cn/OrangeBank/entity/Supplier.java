package cn.OrangeBank.entity;


import java.util.Date;

public class Supplier {

  private Integer supplierId;
  private String supplierName;
  private String supplierContact;
  private String supplierPhone;
  private Integer supplierStatic;
  private Date supplierCooperationtime;


  public Integer getSupplierId() {
    return supplierId;
  }

  public void setSupplierId(Integer supplierId) {
    this.supplierId = supplierId;
  }

  public String getSupplierName() {
    return supplierName;
  }

  public void setSupplierName(String supplierName) {
    this.supplierName = supplierName;
  }

  public String getSupplierContact() {
    return supplierContact;
  }

  public void setSupplierContact(String supplierContact) {
    this.supplierContact = supplierContact;
  }

  public String getSupplierPhone() {
    return supplierPhone;
  }

  public void setSupplierPhone(String supplierPhone) {
    this.supplierPhone = supplierPhone;
  }

  public Integer getSupplierStatic() {
    return supplierStatic;
  }

  public void setSupplierStatic(Integer supplierStatic) {
    this.supplierStatic = supplierStatic;
  }

  public Date getSupplierCooperationtime() {
    return supplierCooperationtime;
  }

  public void setSupplierCooperationtime(Date supplierCooperationtime) {
    this.supplierCooperationtime = supplierCooperationtime;
  }
}
