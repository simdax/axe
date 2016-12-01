(// start a process
s.boot

// simple example
(
a=PAT.envirPoly;
a.pattern.play
)
a.io=(amp:0.4,appo:[0], rythme:[0.35]);
a.jo=(amp:0,dur:[0.5,1,2,0.5,0.5]/2, octave:6);
a.tch=(type:\appo, degree:`[0,1,2,1], rhythme:1)
a.bob=a.io.envir;
a.bob.mtranspose=[1,2,1];
a.bob.appo=0;
// a.acc=(appo:0,octave:4,instrument:\cheappiano,
// 	degree:[0,[0,2],[2,4]], dur:1,
// 	amp:0.1
// );

b.play.play

// b={var b;
// SFZProxy.clearAll;
// b=PAT.envirPoly;
// z={SFZProxy()}!3;
// SFZProxy.gui;
// b.o=(amp:1, degree:[0,3,2,1], dur:5 , instrument:\sfz_1002);
// b.do=(amp:1, dur:0.25,  instrument:\sfz_1003);
// b.ot=(amp:1, appo:[1,0], degree:[2,4,3,1], dur:0.25, instrument:\sfz_1004);
// };

// [a,b].do(_.value);

)