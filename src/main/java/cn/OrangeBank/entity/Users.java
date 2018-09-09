package cn.OrangeBank.entity;

public class Users {
    private Integer users_id;//用户id
    private String users_name;//用户账号
    private String users_password;//用户密码
    private String users_phone;//用户电话
    private Integer users_companyid;//关联公司id
    private String users_truename;//真实姓名
    private String users_email;//邮箱
    private  Integer role_id; //关联角色id
    private Role role; //角色
    private  Company company;//公司
    public String getUsers_truename() {
        return users_truename;
    }

    public void setUsers_truename(String users_truename) {
        this.users_truename = users_truename;
    }

    public String getUsers_email() {
        return users_email;
    }

    public void setUsers_email(String users_email) {
        this.users_email = users_email;
    }



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

    public Integer getUsers_companyid() {
        return users_companyid;
    }

    public void setUsers_companyid(Integer users_companyid) {
        this.users_companyid = users_companyid;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
