(
Event.addEventType(\ioio, {
	var ind=~mel.div(2);
	var shift=~mel % (2);
	~degree=
	ind + shift + (ind.div(3)) + (try{~transfo[ind%3]} ? 0);
	~type=\note; currentEnvironment.play;
});
Pbind(
	\type, \ioio,
	\mel, Ptuple(
		Prand((..3), inf) ! 3
	)
).trace.play
)