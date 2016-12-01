// Pbind(
// 	\degree, Pn(PAT.melody.doMatrix.g),
// 	\dur, Pn(RYTHME.object.res.g)
// ).trace

(
degree: PAT.melody.doMatrix,
dur: RYTHME.object.res,
g:{arg s; FlowView(bounds:750@300).flow{arg w; s.degree.g(w); s.dur.g(w)}},
embedInStream:{ arg s, in=();
	Pbind(\degree, Pn(s.degree), \dur, Pn(s.dur)).embedInStream(in);
}
)


