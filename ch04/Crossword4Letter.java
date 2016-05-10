import java.util.regex.Pattern;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Crossword4Letter {
    static int
        n = 0,
        n_q_first = 0,
        n_u_second = 0,
        n_q_then_u = 0;

    static Pattern
        n_q_first_re = Pattern.compile("q..."),
        n_u_second_re = Pattern.compile(".u.."),
        n_q_then_u_re = Pattern.compile("qu..");

    public static void main(String[] args) throws IOException {
        long start = System.currentTimeMillis();

        try ( BufferedReader r =
            new BufferedReader(new FileReader("CROSSWD.TXT"))
            ) {
            String line;
            while ( (line = r.readLine()) != null ) {
                ++n;
                if (n_q_first_re.matcher(line).find()) {
                    ++n_q_first;
                }
                if (n_u_second_re.matcher(line).find()) {
                    ++n_u_second;
                }
                if (n_q_then_u_re.matcher(line).find()) {
                    ++n_q_then_u;
                }
            }
        }

        System.out.println("# 4 letter words = " + n);
        System.out.println("# 4 letter words with q first = " + n_q_first);
        System.out.println("# 4 letter words with u second = " + n_u_second);
        System.out.println("# 4 letter words starting with qu = " + n_q_then_u);
        System.out.printf("P(Q):   %.2f\n", n_q_first / (double)n);
        System.out.printf("P(U):   %.2f\n", n_u_second / (double)n);
        System.out.printf("P(U|Q): %.2f\n", n_u_second / (double)n_q_then_u);
        long total_time = System.currentTimeMillis() - start;

        System.out.printf("total running time: %d\n", total_time);
    }
}
