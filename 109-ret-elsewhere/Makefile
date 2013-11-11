
CFLAGS = -Wall -O0 -Wl,-no_pie

foo: main.o foo.o
	clang $(CFLAGS) -o $@ $^

%.o: %.c
	clang $(CFLAGS) -o $@ -c $^

%.o: %.s
	yasm -f macho64 -o $@ $^

clean:
	rm foo
	rm ./*.o

run:
	./foo

.PHONY: clean run
