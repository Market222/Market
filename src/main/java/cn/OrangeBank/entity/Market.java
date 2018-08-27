package cn.OrangeBank.entity;

public class Market {
    private Integer market_id;//销售商品id
    private Integer market_shooppingid;//商品编号外键id
    private String market_marketBackid;//销售订单id

    private Position position;
    private MarketBack marketBack;
    private Shoopping shoopping;
    private Client client;

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Shoopping getShoopping() {
        return shoopping;
    }

    public void setShoopping(Shoopping shoopping) {
        this.shoopping = shoopping;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public MarketBack getMarketBack() {
        return marketBack;
    }

    public void setMarketBack(MarketBack marketBack) {
        this.marketBack = marketBack;
    }

    public Integer getMarket_id() {
        return market_id;
    }

    public void setMarket_id(Integer market_id) {
        this.market_id = market_id;
    }

    public Integer getMarket_shooppingid() {
        return market_shooppingid;
    }

    public void setMarket_shooppingid(Integer market_shooppingid) {
        this.market_shooppingid = market_shooppingid;
    }

    public String getMarket_marketBackid() {
        return market_marketBackid;
    }

    public void setMarket_marketBackid(String market_marketBackid) {
        this.market_marketBackid = market_marketBackid;
    }
}
