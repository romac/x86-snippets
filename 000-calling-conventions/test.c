
int a( void )
{
    return 42;
}

int b( int x )
{
    return x + 42;
}

int c( int x, int y )
{
    return x + y;
}

float f( float x )
{
    return x + 42.0f;
}

typedef struct Point
{
    int x;
    int y;
} Point;

Point p( Point p )
{
    Point t;
    t.x = p.x + 42;
    t.y = p.y + 42;

    return t;
}

int main( void )
{
    a();
    b( 13 );
    c( 13, 14 );
    f( 8.0f );

    Point point = { 2, 3 };
    p( point );

    return 0;
}
