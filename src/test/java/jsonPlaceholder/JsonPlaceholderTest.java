package jsonPlaceholder;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static helpers.CucumberReport.generateReport;
import static org.junit.jupiter.api.Assertions.assertEquals;

class JsonPlaceholderTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:jsonPlaceholder")
                .outputCucumberJson(true)
                .parallel(5);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:jsonPlaceholder").tags("@debug").relativeTo(getClass());
    }
}
