# Simple program to demonstrate time taken and peak memory utilization for execution of a toy python program(interpreted language) involving a simple for loop
# Shreyas Havaldar, CS18BTECH11042

import time

s=time.time()
c=0
for i in range (10000):
    c=c+1
e=time.time()
print("%.7e seconds" % (e-s))

# So the time take for execution of the for loop from 0 to 10,000 is consistently around 10^(-3) seconds
# Command: python q1_e.py
# Output:
# 1.6570091e-03 seconds
# Command: /usr/bin/time -v python q1_e.py 
# Output:
# 1.6570091e-03 seconds
#         Command being timed: "python q1_e.py"
#         User time (seconds): 0.01
#         System time (seconds): 0.00
#         Percent of CPU this job got: 100%
#         Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.01
#         Average shared text size (kbytes): 0
#         Average unshared data size (kbytes): 0
#         Average stack size (kbytes): 0
#         Average total size (kbytes): 0
#         Maximum resident set size (kbytes): 7668
#         Average resident set size (kbytes): 0
#         Major (requiring I/O) page faults: 0
#         Minor (reclaiming a frame) page faults: 867
#         Voluntary context switches: 1
#         Involuntary context switches: 0
#         Swaps: 0
#         File system inputs: 0
#         File system outputs: 0
#         Socket messages sent: 0
#         Socket messages received: 0
#         Signals delivered: 0
#         Page size (bytes): 4096
#         Exit status: 0
# 
# Peak RAM utilization during execution and concurrent interpretation is: 7668 KB using the /usr/bin/time -v command.