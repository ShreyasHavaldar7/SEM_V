// Simple IO program to demonstrate how GCC compiler handles errors
// Shreyas Havaldar, CS18BTECH11042

#include<stdio.h>

int main(){

    printf("Shreyas\n");
    printf("Havaldar\n);
    printf("CSE\n");
    printf("18\n);



    return 0;
}

// On compiling the file, using gcc q1.c, all the errors in the file are displayed at once. All statements with errors are displayed together.
// Command: gcc q1.c
// Output:
// q1.c: In function ‘main’:
// q1.c:9:12: warning: missing terminating " character
//      printf("Havaldar\n);
//             ^
// q1.c:9:12: error: missing terminating " character
//      printf("Havaldar\n);
//             ^~~~~~~~~~~~~
// q1.c:10:20: error: expected ‘)’ before ‘;’ token
//      printf("CSE\n");
//                     ^
// q1.c:11:12: warning: missing terminating " character
//      printf("18\n);
//             ^
// q1.c:11:12: error: missing terminating " character
//      printf("18\n);
//             ^~~~~~~
// q1.c:10:5: warning: passing argument 1 of ‘printf’ makes pointer from integer without a cast [-Wint-conversion]
//      printf("CSE\n");
//      ^~~~~~
// In file included from q1.c:4:0:
// /usr/include/stdio.h:318:12: note: expected ‘const char * restrict’ but argument is of type ‘int’
//  extern int printf (const char *__restrict __format, ...);
//             ^~~~~~
// q1.c:16:1: warning: format not a string literal and no format arguments [-Wformat-security]
//  }
//  ^
// q1.c:16:1: error: expected declaration or statement at end of input
