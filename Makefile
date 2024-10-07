hfk_out: hfk compile assemble
	./compile hfk tmp
	nasm -f elf64 tmp -o tmp.o
	ld tmp.o -o hfk_out

hfk_out2: hfk_out hfk
	./hfk_out hfk tmp
	nasm -f elf64 tmp -o tmp.o
	ld tmp.o -o hfk_out2

hfk_out3: hfk_out2 hfk
	./canda hfk_out2 assemble hfk hfk_out3


cfc_out: cfc compile assemble
	./canda compile assemble cfc cfc_out

cfc_out2: cfc_out cfc
	./canda compile cfc_out cfc cfc_out2

cfc_out3: cfc_out cfc
	./canda compile cfc_out2 cfc cfc_out3
