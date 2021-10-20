compile: master.pas
	fpc -FU.build -FEbin master.pas

run: compile
	bin/master

testcompile: 
	fpc -FU.build -FEbin runtests.pas

test: bin/runtests
	bin/runtests