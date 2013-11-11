
CFLAGS = -Wall -O1

foo: main.o
	clang $(CFLAGS) -o $@ $^

asm: main.c
	clang $(CFLAGS) -S -mllvm --x86-asm-syntax=intel $^

%.o: %.c
	clang $(CFLAGS) -o $@ -c $^

%.o: %.s
	yasm -f macho64 -o $@ $^

clean:
	rm foo
	rm ./*.o

run:
	./foo

.PHONY: asm clean run
