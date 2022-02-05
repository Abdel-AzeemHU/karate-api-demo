package reqres;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import static helpers.CucumberReport.generateReport;
import static org.junit.jupiter.api.Assertions.*;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

class ReqResTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:reqres")
                .outputCucumberJson(true)
                .parallel(5);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:reqres").tags("@debug").relativeTo(getClass());
    }
}
