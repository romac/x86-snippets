
#include <stdio.h>

float __cdecl add( float x, float y );

int main( void )
{
    printf( "%f\n", add( 3.12f, 123.4f ) );

    return 0;
}
