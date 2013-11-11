
CFLAGS = -Wall -Os

rc_memcpy: main.o rc_memcpy.o
	clang $(CFLAGS) -o $@ $^

%.o: %.c
	clang $(CFLAGS) -o $@ -c $^

%.o: %.s
	yasm -f macho64 -o $@ $^

clean:
	rm rc_memcpy
	rm ./*.o

run:
	./rc_memcpy

.PHONY: clean run
