(
var a={arg x; x-(x.mean)};
var b={arg x; (x.sum+a.(x))/x.sum};

PdefAllGui();
s.boot; s.makeGui;

Event.addEventType(\appo,{ arg self;
	var dur,add;
	~degree=(~degree+~mtranspose).degreeToKey(~arpege?[0,2,4],7);
	~dur=~dur*((~rythme?1) * (~absolu.asBoolean.if{~dur.reciprocal}{1}));
	~mtranspose=0;
	//	~scale=Scale.at(~mode?\major);
	~appo ?? {~appo=0};
	add=Array.series(~appo.abs+1,~appo,~appo.sign.neg);
	dur=b.((~swing?[1]).wrapExtend(~appo.abs+1));
	// tricky system to play with sfz....
	~instrument.asString.beginsWith("sfz_").if{
		~type=\sfz; ~inst=~instrument.asString.drop(4).asInt;
	}{~type=\note};
	Pbind(\degree,add.iter+~degree, \dur, dur.ns.iter*~dur)
	//	.trace([\degree,\mtranspose,\dur])
	.play(protoEvent:currentEnvironment);
});
)

