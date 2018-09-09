package cn.OrangeBank.entity;

public class Client {
    private Integer client_id;//客户ID
    private String client_name;//客户姓名
    private String client_address;//送货地址
    private String client_phone;//手机
    private String client_specialplane;//座机
    private String client_salesman;//销售员
    private String client_invoice;//销售发票号

    public Integer getClient_id() {
        return client_id;
    }

    public void setClient_id(Integer client_id) {
        this.client_id = client_id;
    }

    public String getClient_name() {
        return client_name;
    }

    public void setClient_name(String client_name) {
        this.client_name = client_name;
    }

    public String getClient_address() {
        return client_address;
    }

    public void setClient_address(String client_address) {
        this.client_address = client_address;
    }

    public String getClient_phone() {
        return client_phone;
    }

    public void setClient_phone(String client_phone) {
        this.client_phone = client_phone;
    }

    public String getClient_specialplane() {
        return client_specialplane;
    }

    public void setClient_specialplane(String client_specialplane) {
        this.client_specialplane = client_specialplane;
    }

    public String getClient_salesman() {
        return client_salesman;
    }

    public void setClient_salesman(String client_salesman) {
        this.client_salesman = client_salesman;
    }

    public String getClient_invoice() {
        return client_invoice;
    }

    public void setClient_invoice(String client_invoice) {
        this.client_invoice = client_invoice;
    }
}
