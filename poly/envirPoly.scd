// generates a placeholder for voices
EnvironmentRedirect().make{ arg s;
	~seed=Harmonie.mat.g;
	~state=();
	~epp=EventPatternProxy(Plazy{
		Pbind(\degree,Plazy{s[\seed]}).trace;
	}.collect{arg ev; s[\state]=ev.degree; Rest()});
	~mel=Pbind( 
		\type, \appo,
		\scale, Pfunc{s[\state]}
	);
	~quant=4;
	~forward={arg s, sel ... args;
		// automatic creates 
		s.put(sel,())
	}
}.know_(true)
.dispatch_{arg k,v,s;
	// fill an envir with a new pattern
	k.switch(
		// this is a trick, since degree is just a collector for main pattern epp, it should not be overiden
		\state, {}, 
		\quant,{
			s.kvdo{arg k,v;
				Pdef(k).align(v)
			}
		},{
			var res=MyPPE().make{
				// default keys
				~instrument=\cheappiano;
				~degree=0; ~dur=1; ~appo=[0];
				~mtranspose=0;
			}; res.putAll(v);
			s.localPut(k,res);
			/////////////////
			s.epp.isPlaying.not.if{s.epp.play};
			// play bass pattern if necessary
			Pdef(k, s.mel <> res.asPattern)
			.quant_(s.quant)
			.play
		}
	)
}
