package cn.OrangeBank.entity;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Returns {

  private String returns_id;
  private String returns_returnsobjection;
  private String returns_state;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date returns_sendtime;
  private String returns_stateConfirmation;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date returns_confirmedtime;
  private String returns_objectionstatus;
  private String returns_objection;
  private double returns_countmoney;
  private String returns_warehousestatus;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date returns_warehousetime;
  private String returns_takestatus;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date returns_taketime;
  private String returns_paymentstatus;
  private long returns_userid;

  List<Returnsshoop> ret=new ArrayList<Returnsshoop>();

  public List<Returnsshoop> getRet() {
    return ret;
  }

  public void setRet(List<Returnsshoop> ret) {
    this.ret = ret;
  }

  public String getReturns_id() {
    return returns_id;
  }

  public void setReturns_id(String returns_id) {
    this.returns_id = returns_id;
  }

  public String getReturns_returnsobjection() {
    return returns_returnsobjection;
  }

  public void setReturns_returnsobjection(String returns_returnsobjection) {
    this.returns_returnsobjection = returns_returnsobjection;
  }

  public String getReturns_state() {
    return returns_state;
  }

  public void setReturns_state(String returns_state) {
    this.returns_state = returns_state;
  }

  public Date getReturns_sendtime() {
    return returns_sendtime;
  }

  public void setReturns_sendtime(Date returns_sendtime) {
    this.returns_sendtime = returns_sendtime;
  }

  public String getReturns_stateConfirmation() {
    return returns_stateConfirmation;
  }

  public void setReturns_stateConfirmation(String returns_stateConfirmation) {
    this.returns_stateConfirmation = returns_stateConfirmation;
  }

  public Date getReturns_confirmedtime() {
    return returns_confirmedtime;
  }

  public void setReturns_confirmedtime(Date returns_confirmedtime) {
    this.returns_confirmedtime = returns_confirmedtime;
  }

  public String getReturns_objectionstatus() {
    return returns_objectionstatus;
  }

  public void setReturns_objectionstatus(String returns_objectionstatus) {
    this.returns_objectionstatus = returns_objectionstatus;
  }

  public String getReturns_objection() {
    return returns_objection;
  }

  public void setReturns_objection(String returns_objection) {
    this.returns_objection = returns_objection;
  }

  public double getReturns_countmoney() {
    return returns_countmoney;
  }

  public void setReturns_countmoney(double returns_countmoney) {
    this.returns_countmoney = returns_countmoney;
  }

  public String getReturns_warehousestatus() {
    return returns_warehousestatus;
  }

  public void setReturns_warehousestatus(String returns_warehousestatus) {
    this.returns_warehousestatus = returns_warehousestatus;
  }

  public Date getReturns_warehousetime() {
    return returns_warehousetime;
  }

  public void setReturns_warehousetime(Date returns_warehousetime) {
    this.returns_warehousetime = returns_warehousetime;
  }

  public String getReturns_takestatus() {
    return returns_takestatus;
  }

  public void setReturns_takestatus(String returns_takestatus) {
    this.returns_takestatus = returns_takestatus;
  }

  public Date getReturns_taketime() {
    return returns_taketime;
  }

  public void setReturns_taketime(Date returns_taketime) {
    this.returns_taketime = returns_taketime;
  }

  public String getReturns_paymentstatus() {
    return returns_paymentstatus;
  }

  public void setReturns_paymentstatus(String returns_paymentstatus) {
    this.returns_paymentstatus = returns_paymentstatus;
  }

  public long getReturns_userid() {
    return returns_userid;
  }

  public void setReturns_userid(long returns_userid) {
    this.returns_userid = returns_userid;
  }
}
