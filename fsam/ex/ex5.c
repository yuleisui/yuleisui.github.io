#include "pthread.h"

int *x, y, z;
int **p = &x, *q = &y, *r = &z;

int *c;
pthread_mutex_t mtx;

void *foo(void *ignored) {
pthread_mutex_lock(&mtx);
*p = r;
*p = q;
pthread_mutex_unlock(&mtx);
return NULL;
}

int main(void) {
pthread_t t;
pthread_create(&t, NULL, foo, NULL);
pthread_mutex_lock(&mtx);
c = *p;
pthread_mutex_unlock(&mtx);
return 0;
}

