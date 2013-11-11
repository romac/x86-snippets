
I'm trying to make the function foo() return to inside of bar() instead of main().

Expected output:

    in bar

Result:
    
    [1]    24531 segmentation fault  ./foo

This must have something to do with the linker warning:

    ld: warning: PIE disabled. Absolute addressing (perhaps -mdynamic-no-pic) not allowed in code signed PIE, but used in _foo from foo.o. To fix this warning, don't compile with -mdynamic-no-pic or link with -Wl,-no_pie

But, although I've tried to fiddle with `-fpie`, `-fno-pie`, and other and eventually got rid of the warning, it still segfaults.

I'm almost sure it works because gdb tells me the code jumps to <bar> after ret but it then crashes somewhere inside printf. Maybe a stack alignment issue but I'm not sure how to solve it.
