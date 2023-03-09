#!/usr/bin/env bash


for n in {100..1000..10};
do
  MAX_ITER="$n" mvn test -Dtest=TestOutputSinkWriter &> /dev/null
  sleep 1
  stat -c%s hbase-server/target/surefire-reports/org.apache.hadoop.hbase.wal.TestOutputSinkWriter-output.txt >> output.txt
  sleep 1
done