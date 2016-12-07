(ER({ arg s;
~a=POLY.matrice;
~b=POLY.ensemble;
~b.bobi.do { |x|
	x.dispatch=x.dispatch.addFunc({
		~a.colorizeMatrix(~b.bobi.collect(_.list).postln)
	}.inEnvir(s))
}; 
~b.g;
}
)
)

~b.bobi[0].dispatch=.addFunc({"é".postln})
