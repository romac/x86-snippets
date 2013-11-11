
#include <stdio.h>

void __attribute__ ( ( noinline ) ) bar( void )
{
    static int i = 1;

    printf( "%d\n", i );

    i++;
}

int main( int argc, char ** argv )
{
    bar();
    bar();
    bar();

    return 0;
}
