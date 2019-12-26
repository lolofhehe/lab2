package history;

import java.io.Serializable;
import java.math.BigDecimal;

public class HistoryNode implements Serializable {
    private String x;
    private String y;
    private String r;

    private boolean hit;

    public HistoryNode(String x, String y, String r) throws Exception {
        this.x = x;
        this.y = y;
        this.r = r;

        try {
            BigDecimal bigX = new BigDecimal(x);
            BigDecimal bigY = new BigDecimal(y);
            BigDecimal bigR = new BigDecimal(r);

            if (bigX.abs().compareTo(BigDecimal.valueOf(4)) >= 0) // x > r OR x < -r
                throw new Exception("Некорректное значение X");
            if (bigY.compareTo(BigDecimal.valueOf(3)) >= 0 || bigY.compareTo(BigDecimal.valueOf(-5)) <= 0) // y >= 3 OR y <= -3
                throw new Exception("Некорректное значение Y");
            if (bigR.compareTo(BigDecimal.ONE) <= 0 || bigR.compareTo(BigDecimal.valueOf(4)) >= 0) // r >= 4 OR r <= 1
                throw new Exception("Некорректное значение R");

            this.hit = calculateHit(bigX, bigY, bigR);

        } catch (NumberFormatException exc) {
            throw new Exception("Один из аргументов не является десятичным числом.");
        }
    }

    public String getX() {
        return x;
    }

    public String getY() {
        return y;
    }

    public String getR() {
        return r;
    }

    public boolean isHit() {
        return hit;
    }

    private boolean calculateHit(BigDecimal x, BigDecimal y, BigDecimal r) {
        if (x.compareTo(BigDecimal.ZERO) < 0) { // x < 0
            if (y.compareTo(BigDecimal.ZERO) > 0){ // y > 0
                return false;
            }
            return y.compareTo(x.negate().add(r.negate().divide(BigDecimal.valueOf(2)))) >= 0; //y >= -x - r/2
        }

        if (y.compareTo(BigDecimal.ZERO) >= 0) { // y >= 0
            return x.compareTo(r) <= 0 && y.compareTo(r.divide(BigDecimal.valueOf(2))) <= 0;
        }
        return x.pow(2).add(y.pow(2)).compareTo(r.pow(2).divide(BigDecimal.valueOf(4), BigDecimal.ROUND_HALF_UP)) <= 0; // x^2 + y^2 <= r^2 / 4
    }
}
