out: hfk compile
	./canda compile assemble hfk out

out2: out hfk
	./canda out assemble hfk out2
