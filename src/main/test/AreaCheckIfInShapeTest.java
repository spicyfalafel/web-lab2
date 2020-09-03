
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import ru.itmo.my.GraphArea;
import ru.itmo.my.models.MyPoint;

public class AreaCheckIfInShapeTest {

    static MyPoint p1, p2, p3;
    @BeforeAll
    static void prepare(){
        p1 = new MyPoint(1, 1, 1);
        p2 = new MyPoint(2,2,1);
        p3 = new MyPoint(4, 4, 1);
    }

}
