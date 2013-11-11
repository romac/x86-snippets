
#include <stdio.h>

#define floating_point long double

floating_point __cdecl add( floating_point x, floating_point y )
{
    return x + y;
}

int main( void )
{
    printf( "%Lf\n", add( 3.89f, 12.34f ) );
}
