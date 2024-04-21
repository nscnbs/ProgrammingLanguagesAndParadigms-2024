// gnatmake -o program main_loop.adb
// gcc -c main_loop_wrapper.c
// gcc -o loop_wrapper main_loop_wrapper.o library_loop.o -lgnat

#include <stdio.h>
#include "library_wrapper.h"

int main()
{
    printf("C WRAPPER ADA LOOP\n");

    // Factorial
    int n = 5;
    printf("%d! = %d\n", n, factorial(n));

    // NWD
    int num1 = 36, num2 = 48;
    printf("NWD: %d i %d = %d\n", num1, num2, nwd(num1, num2));

    // Diofantic
    int a = 120, b = 144, c = 72; // x = -3, y = 3
    // int a = 18, b = 24, c = 30; // x = -5, y = 5
    // int a = 120, b = 144, c = 71; // brak
    struct DiofanticResult result = diofantic(a, b, c);
    if (result.X != -1 && result.Y != -1)
    {
        printf("Rozwiazanie rownania %dx + %dy = %d to x = %d, y = %d\n", a, b, c, result.X, result.Y);
    }
    else
    {
        printf("Brak rozwiazania dla rownania %dx + %dy = %d\n", a, b, c);
    }

    return 0;
}