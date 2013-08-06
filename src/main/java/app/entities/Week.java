package app.entities;

/**
 * Created with IntelliJ IDEA.
 * User: test
 * Date: 01.08.13
 * Time: 18:06
 * To change this template use File | Settings | File Templates.
 */
public enum Week {
    Monday(0),Tuesday(1),Wednesday(2),Thursday(3),Friday(4),Saturday(5),Sunday(6);
    private final int value;

    private Week(int value) {
        this.value = value;
    }
    public int getValue() {
        return value;
    }
}
