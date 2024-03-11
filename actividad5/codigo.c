#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
  printf("Hilo ejecutandose\n");
  return NULL;
}

int main() {
  pid_t pid;

  pid = fork();

  if (pid == 0) { /* child process */
    fork();
    pthread_t thread;
    pthread_create(&thread, NULL, thread_function, NULL);
    pthread_join(thread, NULL);
  }

  fork();

  return 0;
}
