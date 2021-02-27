package po.post;

public class KV {
    public int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "KV{" +
                ", value=" + value +
                '}';
    }
}
