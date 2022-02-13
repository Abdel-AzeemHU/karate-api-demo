# karate demo for API test automation

## Overview
This is Test Automation demo for APIs by Karate DSL, Karate is the only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. Assertions and HTML reports are built-in, and you can run tests in parallel for speed.

### What does the demo include?
- Automate the possible test cases for two APIs docs.
- Using GitHub Actions to execute our tests.
- Parallel execution.
- Cucumber report.
- Running in container.

## Compose

Before running with `docker-compose` make sure `entrypoint.sh` is executable

```shell
chmod +x entrypoint.sh
```

Run with compose

```shell
docker-compose up -d
```

### Regression Test

```shell
docker-compose start karate-test
```

## Test Report

Report will be available upon test run on `http://localhost:8000`