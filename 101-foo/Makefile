
foo: main.o foo.o
	clang -o $@ $^

%.o: %.c
	clang -o $@ -c $^

%.o: %.s
	yasm -f macho32 -o $@ $^

clean:
	rm ./*.o

.PHONY: clean
