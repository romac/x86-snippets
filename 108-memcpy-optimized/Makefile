
CFLAGS = -Wall -O0

xs_memcpy: main.o xs_memcpy.o
	clang $(CFLAGS) -o $@ $^

%.o: %.c
	clang $(CFLAGS) -o $@ -c $^

%.o: %.s
	yasm -f macho64 -o $@ $^

clean:
	rm xs_memcpy
	rm ./*.o

run:
	./xs_memcpy

.PHONY: clean run
