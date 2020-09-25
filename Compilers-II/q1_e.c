// Simple program to demonstrate time taken and peak memory utilization for execution of a toy C program(compiled language) involving a simple for loop
// Shreyas Havaldar, CS18BTECH11042

#include <stdio.h>
#include <time.h>

int main() {

    clock_t s,e;
    s = clock();
    int c=0;
    for(int i=0;i<10000;i++) {
        c++;
    }
    e = clock();
    printf("%.7e seconds\n", (double)(((double)e-s))/CLOCKS_PER_SEC); 
    
    return 0;
}
// So the time take for execution of the for loop from 0 to 10,000 is consistently around 10^(-5) seconds
// Command: gcc q1_e.c, followed by ./a.out
// Ouput:
// 2.9000000e-05 seconds
// 
// Command: /usr/bin/time -v gcc q1_e.c 
// Output:
//         Command being timed: "gcc q1_e.c"
//         User time (seconds): 0.05
//         System time (seconds): 0.00
//         Percent of CPU this job got: 100%
//         Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.06
//         Average shared text size (kbytes): 0
//         Average unshared data size (kbytes): 0
//         Average stack size (kbytes): 0
//         Average total size (kbytes): 0
//         Maximum resident set size (kbytes): 19664
//         Average resident set size (kbytes): 0
//         Major (requiring I/O) page faults: 0
//         Minor (reclaiming a frame) page faults: 4468
//         Voluntary context switches: 13
//         Involuntary context switches: 0
//         Swaps: 0
//         File system inputs: 0
//         File system outputs: 40
//         Socket messages sent: 0
//         Socket messages received: 0
//         Signals delivered: 0
//         Page size (bytes): 4096
//         Exit status: 0
// 
// Command: /usr/bin/time -v ./a.out
// Output:
// 2.9000000e-05 seconds
//         Command being timed: "./a.out"
//         User time (seconds): 0.00
//         System time (seconds): 0.00
//         Percent of CPU this job got: ?%
//         Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.00
//         Average shared text size (kbytes): 0
//         Average unshared data size (kbytes): 0
//         Average stack size (kbytes): 0
//         Average total size (kbytes): 0
//         Maximum resident set size (kbytes): 1664
//         Average resident set size (kbytes): 0
//         Major (requiring I/O) page faults: 0
//         Minor (reclaiming a frame) page faults: 63
//         Voluntary context switches: 1
//         Involuntary context switches: 0
//         Swaps: 0
//         File system inputs: 0
//         File system outputs: 0
//         Socket messages sent: 0
//         Socket messages received: 0
//         Signals delivered: 0
//         Page size (bytes): 4096
//         Exit status: 0
// 
// Peak RAM utilization during compilation is: 19664 KB using the /usr/bin/time -v command.
// Peak RAM untilization during run/execution time is: 1664 KB using the /usr/bin/time -v command.