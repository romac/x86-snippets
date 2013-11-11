
add: main.o add.o
	clang -o $@ $^
	./add

%.o: %.c
	clang -o $@ -c $^

%.o: %.s
	yasm -f macho64 -o $@ $^

clean:
	rm add
	rm ./*.o

.PHONY: clean
