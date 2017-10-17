#include "pthread.h"

int *x, y, z;
int **p = &x, *q = &y, *r = &z;

int *c;

void *foo(void *ignored) {
*p = q;
return NULL;
}

int main(void) {
*p = r;
pthread_t t;
pthread_create(&t, NULL, foo, NULL);
pthread_join(t, NULL);
c = *p;
return 0;
}

