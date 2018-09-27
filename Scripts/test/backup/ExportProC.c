/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : ExportProC.c

* Purpose : Utility to rename and classiy files.

* Creation Date : 27-09-2018

* Last Modified : Jeu 27 sep 21:21:16 2018

* Created By : Simon Trux

_._._._._._._._._._._._._._._._._._._._._.*/
#ifdef WIN32
#include <windows.h>
#elif _POSIX_C_SOURCE >= 199309L
#include <time.h>   // for nanosleep
#endif

#define BUFFER 512

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

// includes for file status
#include <sys/types.h>
#include <sys/stat.h>


//				MY SLEEP FUNCTION

void	sl2(void)
{
	float time;

	time = 1;
	sleep(time);
}

// 			cross-platform sleep function

#define sl(...) sleepms((150, ##__VA_ARGS__))


void sleepms(int milliseconds) 
{
	#ifdef  WIN32
    	Sleep(milliseconds);
	#elif _POSIX_C_SOURCE >= 199309L
		struct timespec ts;
		ts.tv_sec = milliseconds / 1000;
		ts.tv_nsec = (milliseconds % 1000) * 1000000;
		nanosleep(&ts, NULL);
	#else
		usleep(milliseconds * 1000);
	#endif

}
//				OPENING MESSAGE

void	ft_opening_msg(void)
{
	printf("\nWelcome to ExportProC v.0.1.1 by Simon Trux.\n"); sl();
	printf("\n"); sl();
	printf("ExportPro is a simple tool that will\n"); sl();
	printf("handle automaticly  renaming and sorting of files\n"); sl();
	printf("\n"); sl();
	printf("It will :\n"); sl();
	printf("	- detect file type based on extension,\n"); sl();
	printf("	- create appropriate directories;\n"); sl();
	printf("	- rename and move the files.\n"); sl();
	printf("At any moment you may write \"exit\" to exit this program.\n"); sl();
	printf("\n"); sl();
}

//				READING STR AND MALLOC

char	*ft_read_malloc(void)

{
	char *user_input;

	if (!(user_input = malloc(sizeof(user_input) * BUFFER)))
	{
		printf("Memory error");
		return (0);
	}
	scanf("%s", user_input); 
	return (user_input);
}

//				FT CHECK FILE TYPE

int		ft_file_type(char *address)
{
	struct stat buffer;
	int         status;

	status = stat(address, &buffer);
	printf("status : %d\n", status);

	return (0);
}

//				READING DIR PATH

char	*ft_read_path(void)
{
	char *path;

	printf("Please drag and drop the folder you want to sort from and press enter :\n"); sl();
	path = ft_read_malloc();
	ft_file_type(path);

	printf("Chosen folder is : %s\n", path);
	return (path);
}
//				THE MAIN

int	main(void)
{
	char *dir_path;

	ft_opening_msg();
	dir_path = ft_read_path(); //reading dir path
	
	
	return (0);
}
