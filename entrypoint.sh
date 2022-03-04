#! /bin/bash

mvn clean test -Dkarate.env=e2e
status=$?
cp -r /app/target/cucumber-html-reports/* /report
cp /app/httpd/.htaccess /report

exit $status