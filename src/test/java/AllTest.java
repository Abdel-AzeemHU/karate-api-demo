import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static helpers.CucumberReport.generateReport;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class AllTest {
    @Test
    void testParallel() {
        Results results =
                Runner.path("src/test/java")
                .outputCucumberJson(true)
                .parallel(5);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
