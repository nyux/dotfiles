#include <stdio.h>
#include <time.h>

int main(void) {
	
    /* Things I wanna do. Changes with time, of course. */
	char *topics[] = {"novel", "drawing", "assembly", "short stories",
        "read fiction", "go", "read non-fiction", "perl", "irc bot",
		"calc", "discrete maths", "relax", "real analysis", "haskell"};
	int num_of_topics = sizeof(topics)/sizeof(char *);

	struct tm *today;
	time_t now = time(NULL);

	localtime_r(&now, today);

	printf("suggested: %s\n", topics[today->tm_yday % num_of_topics]);

}
