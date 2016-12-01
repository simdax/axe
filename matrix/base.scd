// simple interface for a complete Rhythm + Melody voice

(
degree: PAT.melody.doMatrix,
dur: RYTHME.object.res,
reSet:{arg s; s.dur.coun=0; s.degree.coun=0},
g:{arg s; FlowView(bounds:750@300).flow{arg w; s.degree.g(w); s.dur.g(w)}; s},
embedInStream:{ arg s, in=();
	Pbind(\degree, Pn(s.degree),
		\dur,// Pwhite()
		Plazy(s.dur)
	).embedInStream(in);
}
)


