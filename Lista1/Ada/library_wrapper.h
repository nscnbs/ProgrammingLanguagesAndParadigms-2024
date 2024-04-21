#ifndef LIBRARY_WRAPPER_H
#define LIBRARY_WRAPPER_H

struct DiofanticResult
{
    int X;
    int Y;
};

extern int factorial(int N);
extern int nwd(int A, int B);
extern struct DiofanticResult diofantic(int A, int B, int C);

#endif // LIBRARY_WRAPPER_H