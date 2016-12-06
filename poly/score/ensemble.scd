ER({ arg s;
	~nbV=3; ~win=FlowView(bounds:280@570);
	~bobi={PAT.mel} ! ~nbV;
	~g={  ~bobi.postln;
		//		s.gui(numItems:5);
		~bobi.do(_.gui(parent:~win));
		s
	}.inEnvir(s);
	~embedInStream={arg s,in;
		Pbind(
			\degree, Ptuple(s.bobi.collect({|x|
				x.mel.iter.repeat
			})),
		).embedInStream(in)
	}; 
	~pl={ arg s, time=4;
		Pn(Plazy(s).finDur(time)).trace.play
	}
},{ arg s; 
	//~win.removeAll; ~g.();
	//	nil
});



