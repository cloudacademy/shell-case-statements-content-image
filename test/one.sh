#!/usr/bin/env bash

chmod a+x solution.sh
grep "case" ../src/lab_script.sh && grep "esac" ../src/lab_script.sh && diff <(../src/lab_script.sh) <(./solution.sh)
# compare two outputs from student script and working script