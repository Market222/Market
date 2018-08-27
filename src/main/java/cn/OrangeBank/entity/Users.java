package cn.OrangeBank.entity;

public class Users {
    private Integer users_id;//用户id
    private String users_name;//用户账号
    private String users_password;//用户密码
    private String users_phone;//用户电话
    private String users_company;//公司名称

    public Integer getUsers_id() {
        return users_id;
    }

    public void setUsers_id(Integer users_id) {
        this.users_id = users_id;
    }

    public String getUsers_name() {
        return users_name;
    }

    public void setUsers_name(String users_name) {
        this.users_name = users_name;
    }

    public String getUsers_password() {
        return users_password;
    }

    public void setUsers_password(String users_password) {
        this.users_password = users_password;
    }

    public String getUsers_phone() {
        return users_phone;
    }

    public void setUsers_phone(String users_phone) {
        this.users_phone = users_phone;
    }

    public String getUsers_company() {
        return users_company;
    }

    public void setUsers_company(String users_company) {
        this.users_company = users_company;
    }
}
