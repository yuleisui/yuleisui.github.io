#include "pthread.h"

int *x, y, z;
int **p = &x, *q = &y, *r = &z;

int *c;

void bar(){
   *p = q;
   c = *p;
}

void *foo(void *ignored) {
pthread_t t;
*p = q;
pthread_create(&t, NULL, bar, NULL);
return NULL;
}

int main(void) {
pthread_t t;
pthread_create(&t, NULL, foo, NULL);
pthread_join(t, NULL);
*p = r;
return 0;
}

