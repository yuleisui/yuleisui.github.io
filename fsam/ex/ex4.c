#include "pthread.h"

int *x, y, z;
int **p = &x, *q = &y, *r = &z;

int *c;

void *foo(void *ignored) {
*p = q;
*x = r;
return NULL;
}

int main(void) {
pthread_t t;
pthread_create(&t, NULL, foo, NULL);
c = *p;
return 0;
}

