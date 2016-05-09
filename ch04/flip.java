import static java.lang.Math.random;
import java.lang.StringBuffer;

public class flip {
    public static void main(String[] args) {
        int flips = Integer.parseInt(args[0]);
        int count = 0;
        StringBuffer record = new StringBuffer();
        
        double proportion = 0.;
        for (int n = 1; n <= flips; ++n) {
            if ( random() > 0.5 ) {
                ++count;
                record.append("H");
            } else {
                record.append("T");
            }

            proportion = count / (double)n;
            System.out.printf("%.2f\n", proportion);
        }

        System.out.println(record.toString());
    }
}
