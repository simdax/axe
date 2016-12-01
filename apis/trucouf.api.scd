(
explosionFatale:{
	a=Pbind(\dur, 0.2, \dur, Pwhite()).play
},
stop:{a.stop},
go:{Pbind(\degree, Pdefn(\up)).play},
up:{arg val; Pdef(\up,val)}
)