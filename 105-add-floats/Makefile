
add: main.o add.o
	clang -g -o $@ $^

run:
	./add

%.o: %.c
	clang -g -o $@ -c $^

%.o: %.s
	yasm -f macho64 -o $@ $^

clean:
	rm add
	rm ./*.o

.PHONY: clean
