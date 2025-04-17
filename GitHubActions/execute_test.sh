#!/bin/bash

VERSION=$1

cd ./workdir/postgresql-${VERSION}/contrib/parquet_s3_fdw

# Execute test script
chmod +x ./test.sh
./test.sh

last_line=$(tail -n 1 make_check.out)
third_line_from_the_last=$(tail -n 3 make_check.out | head -n 1)

pattern=" All [0-9]+ tests passed.+"

if [[ "$last_line" =~ $pattern ]]; then
	echo "last_line"

elif [[ "$third_line_from_the_last" =~ $pattern ]]; then
	 echo "$third_line_from_the_last"
else
	echo "Error : not All the tests passed"
	echo "last line : '$last_line'"
	echo "thierd_line_from_the_last : '$third_line_from_the_last'"
	exit 1
fi
