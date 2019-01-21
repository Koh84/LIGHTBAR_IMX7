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

//LED 1
#define LED_BRIGHTNESS_LED1_R "/sys/class/leds/d1_1/brightness" //RED of LED 1
#define LED_BRIGHTNESS_LED1_G "/sys/class/leds/d2_1/brightness" //GREEN of LED 1
#define LED_BRIGHTNESS_LED1_B "/sys/class/leds/d3_1/brightness" //BLUE of LED 1

//LED 2
#define LED_BRIGHTNESS_LED2_R "/sys/class/leds/d4_1/brightness" //RED of LED 2
#define LED_BRIGHTNESS_LED2_G "/sys/class/leds/d5_1/brightness" //GREEN of LED 2
#define LED_BRIGHTNESS_LED2_B "/sys/class/leds/d6_1/brightness" //BLUE of LED 2

//LED 3
#define LED_BRIGHTNESS_LED3_R "/sys/class/leds/d7_1/brightness" //RED of LED 3
#define LED_BRIGHTNESS_LED3_G "/sys/class/leds/d8_1/brightness" //GREEN of LED 3
#define LED_BRIGHTNESS_LED3_B "/sys/class/leds/d9_1/brightness" //BLUE of LED 3

//LED 4
#define LED_BRIGHTNESS_LED4_R "/sys/class/leds/d1_2/brightness" //RED of LED 4
#define LED_BRIGHTNESS_LED4_G "/sys/class/leds/d2_2/brightness" //GREEN of LED 4
#define LED_BRIGHTNESS_LED4_B "/sys/class/leds/d3_2/brightness" //BLUE of LED 4

//LED 5
#define LED_BRIGHTNESS_LED5_R "/sys/class/leds/d4_2/brightness" //RED of LED 5
#define LED_BRIGHTNESS_LED5_G "/sys/class/leds/d5_2/brightness" //GREEN of LED 5
#define LED_BRIGHTNESS_LED5_B "/sys/class/leds/d6_2/brightness" //BLUE of LED 5

//LED 6
//#define LED_BRIGHTNESS_LED6_R "/sys/class/leds/d7_2/brightness" //RED of LED 6
//#define LED_BRIGHTNESS_LED6_G "/sys/class/leds/d8_2/brightness" //GREEN of LED 6
//#define LED_BRIGHTNESS_LED6_B "/sys/class/leds/d9_2/brightness" //BLUE of LED 6

//LED 7
#define LED_BRIGHTNESS_LED7_R "/sys/class/leds/d1_3/brightness" //RED of LED 7
#define LED_BRIGHTNESS_LED7_G "/sys/class/leds/d2_3/brightness" //GREEN of LED 7
#define LED_BRIGHTNESS_LED7_B "/sys/class/leds/d3_3/brightness" //BLUE of LED 7

//LED 8
#define LED_BRIGHTNESS_LED8_R "/sys/class/leds/d4_3/brightness" //RED of LED 8
#define LED_BRIGHTNESS_LED8_G "/sys/class/leds/d5_3/brightness" //GREEN of LED 8
#define LED_BRIGHTNESS_LED8_B "/sys/class/leds/d6_3/brightness" //BLUE of LED 8

//LED 9
#define LED_BRIGHTNESS_LED9_R "/sys/class/leds/d7_3/brightness" //RED of LED 9
#define LED_BRIGHTNESS_LED9_G "/sys/class/leds/d8_3/brightness" //GREEN of LED 9
#define LED_BRIGHTNESS_LED9_B "/sys/class/leds/d9_3/brightness" //BLUE of LED 9

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

void msleep(unsigned int milliseconds)
{
	usleep(milliseconds*1000);
}

int main(int argc, char **argv)
{

	int count = argc;
	int r = atoi(argv[1]);
	int g = atoi(argv[2]);
	int b = atoi(argv[3]);
	int d1 = atoi(argv[4]);
	int d2 = atoi(argv[5]);
	int cyc = atoi(argv[6]);
	int rd = atoi(argv[7]);
	int gd = atoi(argv[8]);
	int bd = atoi(argv[9]);

	if(argc != 10)
	{
		printf("arguments error\n");
		return -1;
	}

	if(r>255 && g>255 && b>255 && d1 > 1000 && d2 > 1000)
	{
		printf("maximum value exceeded error\n");
		return -1;
	}

	if(r<0 && g<0 && b<0 && d1<0 && d2<0 && cyc<0)
	{
		printf("minimum value exceeded error\n");
		return -1;
	}

	
	
	printf("Write LED");

	char buffer1[32];
	char buffer2[32];
	char buffer3[32];
	int i = 1;
	int j = 1;
	int k = 0;

	write_int(LED_BRIGHTNESS_D1, rd);
	write_int(LED_BRIGHTNESS_D2, gd);
	write_int(LED_BRIGHTNESS_D3, bd);

	write_int(LED_BRIGHTNESS_D4, rd);
	write_int(LED_BRIGHTNESS_D5, gd);
	write_int(LED_BRIGHTNESS_D6, bd);

	write_int(LED_BRIGHTNESS_D7, rd);
	write_int(LED_BRIGHTNESS_D8, gd);
	write_int(LED_BRIGHTNESS_D9, bd);

	for(k=0; k<cyc; k++)
	for(j=1; j<4; j++)
	{

		memset(buffer1, 0, 32);
		snprintf(buffer1, sizeof(buffer1), "/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer1);
		write_int(buffer1, r);

		memset(buffer2, 0, 32);
		snprintf(buffer2, sizeof(buffer2),"/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer2);
		write_int(buffer2, g);

		memset(buffer3, 0, 32);;	
		snprintf(buffer3, sizeof(buffer3), "/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer3);
		write_int(buffer3, b);

		msleep(d1);

		write_int(buffer1, rd);
		write_int(buffer2, gd);
		write_int(buffer3, bd);

		msleep(d2);

		memset(buffer1, 0, 32);
		snprintf(buffer1, sizeof(buffer1), "/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer1);
		write_int(buffer1, r);

		memset(buffer2, 0, 32);
		snprintf(buffer2, sizeof(buffer2),"/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer2);
		write_int(buffer2, g);
	
		memset(buffer3, 0, 32);	
		snprintf(buffer3, sizeof(buffer3), "/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer3);
		write_int(buffer3, b);

		msleep(d1);

		write_int(buffer1, rd);
		write_int(buffer2, gd);
		write_int(buffer3, bd);

		msleep(d2);

		if(j!=2)
		{

		memset(buffer1, 0, 32);
		snprintf(buffer1, sizeof(buffer1), "/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer1);
		write_int(buffer1, r);

		memset(buffer2, 0, 32);
		snprintf(buffer2, sizeof(buffer2),"/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer2);
		write_int(buffer2, g);

		memset(buffer3, 0, 32);	
		snprintf(buffer3, sizeof(buffer3), "/sys/class/leds/d%d_%d/brightness\n", i++, j);
		printf("%s",buffer3);
		write_int(buffer3, b);

		msleep(d1);

		write_int(buffer1, rd);
		write_int(buffer2, gd);
		write_int(buffer3, bd);

		msleep(d2);
		}

		i = 1;
		
	}

	write_int(LED_BRIGHTNESS_D1, 0);
	write_int(LED_BRIGHTNESS_D2, 0);
	write_int(LED_BRIGHTNESS_D3, 0);

	write_int(LED_BRIGHTNESS_D4, 0);
	write_int(LED_BRIGHTNESS_D5, 0);
	write_int(LED_BRIGHTNESS_D6, 0);

	write_int(LED_BRIGHTNESS_D7, 0);
	write_int(LED_BRIGHTNESS_D8, 0);
	write_int(LED_BRIGHTNESS_D9, 0);

	printf("LED written");

	return 0;
}




















