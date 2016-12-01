(
explosionFatale:{ arg reply;
		reply.value(a=Pbind(\dur, 0.2, \dur, Pwhite()).play);
},
boot:{arg reply; s.boot; s.makeGui},
stop:{a.stop},
go:{Pbind(\degree, Pdefn(\up)).play},
up:{arg val; Pdef(\up,val)}
)