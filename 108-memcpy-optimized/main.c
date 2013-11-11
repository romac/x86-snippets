
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <sys/time.h>
#include <sys/resource.h>

double get_time()
{
    struct timeval  t;
    struct timezone tzp;

    gettimeofday( &t, &tzp );

    return t.tv_sec + t.tv_usec * 1e-6;
}

void benchmark( void );

void * xs_memcpy_c( void * dest, const void * src, size_t n )
{
    if( dest == NULL || src == NULL || n == 0 )
    {
        return dest;
    }

          unsigned char * c1;
    const unsigned char * c2;

    c1 = dest;
    c2 = src;

    while( n-- )
    {
        *( c1++ ) = *( c2++ );
    }

    return dest;
}

void * xs_memcpy( void * dest, const void * src, size_t n );

int main( int argc, char ** argv )
{
    const char * src = "Hello, dear world. These are not the droids you are looking for :)";
          char * dest = malloc( strlen( src ) * sizeof( char ) + 1 );

    xs_memcpy( dest, src, strlen( src ) + 1 );

    printf( "src  : %s\n", src );
    printf( "dest : %s\n\n", dest );

    benchmark();

    return 0;
}

#define ITERATIONS 1971520
#define BLOCK_SIZE 1024

void benchmark()
{
    const char * src  = malloc( BLOCK_SIZE * sizeof( char ) );
          char * dest = malloc( BLOCK_SIZE * sizeof( char ) );

    double asm_time = get_time();

    for( unsigned int i = 0; i < ITERATIONS; i++ )
    {
        xs_memcpy( dest, src, BLOCK_SIZE );
    }

    asm_time = get_time() - asm_time;

    printf( "xs_memcpy   : %f\n", asm_time );

    double native_time = get_time();

    for( unsigned int i = 0; i < ITERATIONS; i++ )
    {
        memcpy( dest, src, BLOCK_SIZE );
    }

    native_time = get_time() - native_time;

    printf( "memcpy      : %f\n", native_time );
}
