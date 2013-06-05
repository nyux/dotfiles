#include <stdio.h>
#include <time.h>

int main(void) {
	
	// Things I'm into right now. Changes with time, of course.
	char *topics[] = {"blog", "topology", "perl", "drawing", "c",
		"calc", "discrete maths", "ta work", "real analysis", "haskell"};
	int num_of_topics = sizeof(topics)/sizeof(char *);

	struct tm *today;
	time_t now = time(NULL);

	localtime_r(&now, today);

	printf("%s\n", topics[today->tm_yday % num_of_topics]);

}