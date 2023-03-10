#!/usr/bin/env bash

echo "calls,log_size" >> output.csv

for n in {10..100..10};
do
  MAX_ITER="$n" mvn test -Dtest=TestOutputSinkWriter &> /dev/null
  sleep 1
  log_size=$(stat -c%s hbase-server/target/surefire-reports/org.apache.hadoop.hbase.wal.TestOutputSinkWriter-output.txt)
  sleep 1
  echo "$n,$log_size" >> output.csv
done
