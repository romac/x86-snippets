
LD_FLAGS=-arch i386 -lc -macosx_version_min 10.6

printf: printf.o
	ld -o $@ $^ $(LD_FLAGS)

%.o: %.s
	nasm -f macho -o $@ $^

clean:
	rm printf
	rm printf.o

.PHONY: clean
