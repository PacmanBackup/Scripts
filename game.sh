#!/bin/sh
# Copyright 2018 John Bennett, check the LICENSE file for a full copy of the MIT license
# Set higher I/O and CPU priority of processes running as specific User
nice -n -10 -ionice -c 1 -n 1 su $USER -c "numactl --cpunodebind=0 --membind=0 $1"

