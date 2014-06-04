#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(void) {
	
    struct tm *today = malloc(sizeof(struct tm));
    time_t now = time(NULL);
    tzset();
    localtime_r(&now, today);

    /* Things I wanna do. Changes with time, of course. */
    char *topics[] = {"novel", "drawing", "assembly", "short stories",
        "read fiction", "go", "read non-fiction", "perl", "irc bot",
        "calc", "discrete maths", "relax", "real analysis", "haskell"};
    int num_of_topics = sizeof(topics)/sizeof(char *);

    printf("suggested: %s", topics[today->tm_yday % num_of_topics]);

    if (today->tm_mday >= 23) {
        printf("; pay rent!");
    }

    putchar('\n');

    return 0;
}
