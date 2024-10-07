hfk_out: hfk compile
	./compile hfk tmp
	nasm -f elf64 tmp -o tmp.o
	ld tmp.o -o hfk_out

hfk_out2: hfk_out hfk
	./hfk_out hfk tmp
	nasm -f elf64 tmp -o tmp.o
	ld tmp.o -o hfk_out2

hfk_out3: hfk_out2 hfk
	./hfk_out2 hfk tmp
	nasm -f elf64 tmp -o tmp.o
	ld tmp.o -o hfk_out3

