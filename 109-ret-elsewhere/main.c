
#include <stdio.h>

void foo( void );

void bar( void )
{
    puts( "in bar\n" );
}

int main( int argc, char ** argv )
{
    foo();

    return 0;
}
