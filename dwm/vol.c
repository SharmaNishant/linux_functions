#include <stdio.h>
#include <stdlib.h>

#include "../util.h"

const char *
vol_percentage(void){
    FILE *fp;
    /* Open the command for reading. */
    fp = popen("pacmd list-sinks | awk '/^\\svolume:/{i++} i=='$(pacmd list-sinks | awk '/index:/{i++} /* index:/{print i; exit}')'{print $5; exit}' | awk -F % '{print $1}'", "r");
    if (fp == NULL) {
        printf("Failed to run command\n" );
    }
    /* Read the output a line at a time - output it. */
    if (!(fgets(buf, sizeof buf, fp) != NULL)) {
          fprintf(stderr, "Error reading Command output.\n");
    }
    buf[strcspn(buf, "\r\n")] = 0;

  /* close */
  pclose(fp);
  return buf;
}

