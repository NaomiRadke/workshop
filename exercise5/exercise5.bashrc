#!/bin/bash

for args in `seq 1 20`;
do
qsub exercise5.PBS -v "args=$args"
done
