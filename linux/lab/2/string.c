#include <stdio.h>
#define STR_LENGTH 		10

int main(){
	char Str[STR_LENGTH];
	char* pStr; 
	int i; 
	Str[0] = 'H';
	Str[1] = 'i';
	Str[2] = '!'; 
	Str[3] = '\0'; // special end string character
	printf("The string in Str is : %s\n", Str);
	pStr = &Str[0];

	for(i = 0; i < STR_LENGTH; i++)
	{
		*pStr = '0'+i;
		pStr++; 
	}
	Str[STR_LENGTH-1] = '\0';
	printf("The string in Str is : %s\n" , Str);

	return 0;
}
