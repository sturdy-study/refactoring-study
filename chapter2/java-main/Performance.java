public class Performance {
    private String playId;
    private Integer audience;

    public Performance(String playId, Integer audience) {
        this.playId = playId;
        this.audience = audience;
    }

    public Integer getAudience() {
        return audience;
    }

    public String getPlayId() {
        return playId;
    }
}
