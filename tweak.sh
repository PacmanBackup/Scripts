# Copyright 2018 John Bennett. This software is licensed under the terms of the MIT License, a copy of which is located in the LICENSE file.
# This Script tweaks CPU and GPU settings to increase game performance
#!/bin/sh

if [[ "$1" == "sleep" ]]; then
  echo "SLEEP MODE ENABLED"
  GPU_PERF_LEVEL=low
  CPU_GOVERNOR=powersave
elif [[ "$1" != "off" ]]; then
  echo "GAMING MODE ENABLED"
  GPU_PERF_LEVEL=high
  CPU_GOVERNOR=performance
else
  echo "GAMING MODE DISABLED"
  GPU_PERF_LEVEL=auto
  CPU_GOVERNOR=ondemand
fi


echo $GPU_PERF_LEVEL  > /sys/class/drm/card0/device/power_dpm_force_performance_level
for i in {0..31}
  do
    echo $CPU_GOVERNOR > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor
  done

