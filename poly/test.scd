a=(a:Pbind(\degree, 3))

a.b=Pbind(\degree, 0)
a.c=Pbind(\degree,Pseq([0,4,2,2],inf))
a.d=Pbind(*PAT.base.asPairs)

Plazy{
	Ppar(
		a.values
	).finDur(4).trace
}.repeat.play

/////


Plambda(Plet(\bouzin,Pbind(
	\arpege, Plazy{Harmonie.mat.g.envir},
	[\degree,\dur], Pbind(*PAT.base.asPairs).collect({|c| c.values })
))).trace.play