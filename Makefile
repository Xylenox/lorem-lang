hfk_out: hfk compile
	./canda compile assemble hfk hfk_out

hfk_out2: hfk_out hfk
	./canda hfk_out assemble hfk hfk_out2

cfc_out: cfc compile
	./canda compile assemble cfc cfc_out

cfc_out2: cfc_out cfc
	./canda compile cfc_out cfc cfc_out2