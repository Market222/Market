package cn.OrangeBank.entity;

/*公司表*/
public class Company {
    private  Integer  company_id ;// '公司ID',
    private String company_name; //'公司名称'

    public Integer getCompany_id() {
        return company_id;
    }

    public void setCompany_id(Integer company_id) {
        this.company_id = company_id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }
}
