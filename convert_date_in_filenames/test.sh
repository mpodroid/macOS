#!/bin/bash

# To retain the sample files execute with
# DELETE_SAMPLES=0 ./test.sh

if [[ ! ${DELETE_SAMPLES} ]]
then
    DELETE_SAMPLES=1
fi

rm -rf samples
mkdir samples
for M in Jan June Aug Sept Dec October
do
    touch "samples/File ${M} 2023.pdf"
done

cp rename_dates.command samples/
pushd samples
./rename_dates.command
[ `ls -l *.pdf  | wc -l | tr -d ' '` -eq 6 ] && [ `ls -l *\ 2023-??.pdf  | wc -l | tr -d ' '` -eq 5 ] && echo "Test passed" || echo "Test failed"

popd

if [ ${DELETE_SAMPLES} -eq 1 ]
then
    rm -rf samples
else
    echo "Samples not deleted, please check the results"
fi
