#!/bin/bash
echo "Checking cpu architecture and status..."
cat /proc/cpuinfo

echo "Checking whether cpu is affected by meltdown/spectre"
grep cpu_insecure /proc/cpuinfo

echo "If kernel config file exists in /boot check status of kpti..."
grep CONFIG_PAGE_TABLE_ISOLATION=y /boot/config-`uname -r` && 
echo "patched :)" || echo "unpatched :("

echo "If kernel config file does not exist in /boot check status of kpti via dmesg..."
dmesg | grep "Kernel/User page tables isolation: enabled" && echo "patched" || echo "unpatched" 
 

# Alternate method if config file does not exist (enable if needed)
# grep -sq "x86/pti" /var/log/dmesg && echo "Patched"


