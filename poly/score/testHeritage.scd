(
a=().make{ arg s;
	~pat={PAT.mel}; ~key={Error("must implement").throw};
	~nbV=2; 
	~g={ arg s; s.use{
		~win ?? {~win=FlowView(bounds:280@570)};
		s.gui(numItems:5);
		~bobi=~pat ! ~nbV;
		~bobi.do(_.gui(parent:~win));
		s}
	};
	~embedInStream={arg s,in;
		Pbind(
			s.key, Ptuple(s.bobi.collect({|x|
				try{x.mel}{x}.iter.repeat
			})),
		).embedInStream(in)
	};
	~pl={ arg s, time=4;
		Pn(Plazy(s).finDur(time)).trace.play
	}
};

Window.closeAll;
c=[\amp, \instrument,\degree].collect{
	arg x,i;
	(key:x,pat:[0.2,\cheappiano,{PAT.mel}][i]).parent_(a).g
};
d=c.reduce({arg a,b; Plazy(a)<>Plazy(b)});
d.trace.play
)