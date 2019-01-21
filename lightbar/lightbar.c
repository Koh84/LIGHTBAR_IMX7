#include <cutils/log.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <hardware/lights.h>
#include <stdio.h>
#include <stdlib.h>


//RED
#define LED_BRIGHTNESS_D1 "/sys/class/leds/d1/brightness"
#define LED_BRIGHTNESS_D4 "/sys/class/leds/d4/brightness"
#define LED_BRIGHTNESS_D7 "/sys/class/leds/d7/brightness"

//GREEN
#define LED_BRIGHTNESS_D2 "/sys/class/leds/d2/brightness"
#define LED_BRIGHTNESS_D5 "/sys/class/leds/d5/brightness"
#define LED_BRIGHTNESS_D8 "/sys/class/leds/d8/brightness"

//BLUE
#define LED_BRIGHTNESS_D3 "/sys/class/leds/d3/brightness"
#define LED_BRIGHTNESS_D6 "/sys/class/leds/d6/brightness"
#define LED_BRIGHTNESS_D9 "/sys/class/leds/d9/brightness"

static int write_int (const char *path, int value) {
	int fd;
	static int already_warned = 0;
	fd = open(path, O_RDWR);
	if (fd < 0) {
		if (already_warned == 0) {
			ALOGE("write_int failed to open %s\n", path);
			already_warned = 1;
		}
		return -errno;
	}
	char buffer[20];
	int bytes = snprintf(buffer, sizeof(buffer), "%d\n", value);
	int written = write (fd, buffer, bytes);
	close(fd);
	return written == -1 ? -errno : 0;
}

int main(int argc, char **argv)
{

	int count = argc;
	int r = atoi(argv[1]);
	int g = atoi(argv[2]);
	int b = atoi(argv[3]);
	
	printf("Write LED");
	write_int(LED_BRIGHTNESS_D1, r);
	write_int(LED_BRIGHTNESS_D2, g);
	write_int(LED_BRIGHTNESS_D3, b);

	write_int(LED_BRIGHTNESS_D4, r);
	write_int(LED_BRIGHTNESS_D5, g);
	write_int(LED_BRIGHTNESS_D6, b);

	write_int(LED_BRIGHTNESS_D7, r);
	write_int(LED_BRIGHTNESS_D8, g);
	write_int(LED_BRIGHTNESS_D9, b);
	printf("LED written");

	return 0;
}




















