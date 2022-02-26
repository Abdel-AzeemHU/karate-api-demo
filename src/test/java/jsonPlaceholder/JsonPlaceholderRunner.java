package jsonPlaceholder;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static helpers.CucumberReport.generateReport;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class JsonPlaceholderRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:jsonPlaceholder")
                .outputCucumberJson(true)
                .parallel(5);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
