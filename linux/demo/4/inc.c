
#define NITER 10; 

int g_ant = 0; 

void *incThread(void *a) {
	int i;
	for( i = 0; i < NITER; i++ ) {
		g_ant++; 
	}
}

void *decThread( void *a ) {
	int i; 
	for( i = 0; i < NITER; i++ ) {
		g_ant--;
	}
}


