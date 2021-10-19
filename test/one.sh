#!/usr/bin/env bash

mkdir -p ../check/
# copy what is required from the workspace's /home/project dir
cp --force -r ../src/.bash_history ../check/ 
# check for the result of student activities
grep -r -q "python3 parse.py" ../check/