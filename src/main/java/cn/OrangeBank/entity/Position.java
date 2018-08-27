package cn.OrangeBank.entity;

public class Position {
    private Integer position_id;//编号
    private String position_name;//名称
    private String position_address;//地址
    private String position_Admin;//管理员
    private String position_doorbarn;//门仓/仓库

    public Integer getPosition_id() {
        return position_id;
    }

    public void setPosition_id(Integer position_id) {
        this.position_id = position_id;
    }

    public String getPosition_name() {
        return position_name;
    }

    public void setPosition_name(String position_name) {
        this.position_name = position_name;
    }

    public String getPosition_address() {
        return position_address;
    }

    public void setPosition_address(String position_address) {
        this.position_address = position_address;
    }

    public String getPosition_Admin() {
        return position_Admin;
    }

    public void setPosition_Admin(String position_Admin) {
        this.position_Admin = position_Admin;
    }

    public String getPosition_doorbarn() {
        return position_doorbarn;
    }

    public void setPosition_doorbarn(String position_doorbarn) {
        this.position_doorbarn = position_doorbarn;
    }
}
