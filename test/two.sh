#!/usr/bin/env bash

# test file.txt has 3 or more lines with "match"
[ $(grep -c match ../src/file.txt) -ge 3 ]