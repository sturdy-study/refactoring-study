import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {

    public static void main(String[] args) {
        List<Invoice> invoices = getInvoices();
        Map<String, Play> plays = getPlays();

        invoices.forEach(invoice -> {
            try {
                System.out.println(statement(invoice, plays));
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    public static String statement(Invoice invoice, Map<String, Play> plays) throws Exception {
        int totalAmount = 0;
        int volumeCredits = 0;
        String result = String.format("청구 내역 (고객명: %s)\n", invoice.getCustomer());

        for (Performance perf : invoice.getPerformances()) {
            final Play play = plays.get(perf.getPlayId());
            int thisAmount = 0;

            switch (play.getType()) {
                case "tragedy":
                    thisAmount = 40000;
                    if (perf.getAudience() > 30) {
                        thisAmount += 1000 * (perf.getAudience() - 30);
                    }
                    break;
                case "comedy":
                    thisAmount = 30000;
                    if (perf.getAudience() > 20) {
                        thisAmount += 10000 + 500 * (perf.getAudience() - 20);
                    }
                    thisAmount += 300 * perf.getAudience();
                    break;
                default:
                    throw new Exception(String.format("알 수 없는 장르: %s", play.getType()));
            }
            // 포인트를 적립한다.
            volumeCredits += Math.max(perf.getAudience() - 30, 0);
            // 희극 관객 5명마다 추가 포인트를 제공한다.
            if ("comedy".equals(play.getType())) {
                volumeCredits += Math.floor((float) perf.getAudience() / 5);
            }

            // 청구 내역을 출력한다.
            result += String.format("  %s: $%.2f (%d석)\n", play.getName(), (float) thisAmount / 100, perf.getAudience());
            totalAmount += thisAmount;
        }

        result += String.format("총액: $%.2f\n", (float) totalAmount / 100);
        result += String.format("적립 포인트: %d점\n", volumeCredits);

        return result;
    }


    public static List<Invoice> getInvoices() {
        Performance p1 = new Performance("hamlet", 55);
        Performance p2 = new Performance("as-like", 35);
        Performance p3 = new Performance("othello", 40);

        List<Performance> performances = Arrays.asList(p1, p2, p3);
        Invoice invoice = new Invoice("BigCo", performances);

        return Arrays.asList(invoice);
    }

    public static Map<String, Play> getPlays() {
        Play p1 = new Play("Hamlet", "tragedy");
        Play p2 = new Play("As You Like It", "comedy");
        Play p3 = new Play("Othello", "tragedy");

        return new HashMap<>() {{
            put("hamlet", p1);
            put("as-like", p2);
            put("othello", p3);
        }};
    }
}
