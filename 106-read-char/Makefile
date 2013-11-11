
read: main.o read.o
	clang -o $@ $^

run:
	./read

%.o: %.c
	clang -o $@ -c $^

%.o: %.s
	yasm -f macho64 -o $@ $^

clean:
	rm read
	rm ./*.o

.PHONY: clean
