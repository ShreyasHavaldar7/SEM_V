// Simple program to demonstrate how GCC compiler does not allow for declaring variables without type being specified.
// Shreyas Havaldar, CS18BTECH11042

#include<stdio.h>

int main(){

    t = 2;
    printf("%d\n",t);
    t = "Hello";
    printf("%s\n",t);

    return 0;
}
// Thus we can see that the program does not get compiled at all and throws errors for type information.
// Command: gcc q1_t.c
// Output:
// q1_t.c: In function ‘main’:
// q1_t.c:8:5: error: ‘t’ undeclared (first use in this function)
//      t = 2;
//      ^
// q1_t.c:8:5: note: each undeclared identifier is reported only once for each function it appears in