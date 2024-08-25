hfk_out: hfk compile assemble
	./canda compile assemble hfk hfk_out

hfk_out2: hfk_out hfk
	./canda hfk_out assemble hfk hfk_out2

hfk_out3: hfk_out2 hfk
	./canda hfk_out2 assemble hfk hfk_out3


cfc_out: cfc compile assemble
	./canda compile assemble cfc cfc_out

cfc_out2: cfc_out cfc
	./canda compile cfc_out cfc cfc_out2

cfc_out3: cfc_out cfc
	./canda compile cfc_out2 cfc cfc_out3
