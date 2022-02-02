#! /bin/bash

mvn clean test
cp -r /app/target/cucumber-html-reports/* /report
cp /app/httpd/.htaccess /report