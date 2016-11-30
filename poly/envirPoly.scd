// generates a placeholder for voices
EnvironmentRedirect().make{ arg s;
	~seed=Harmonie.mat.g; ~cantusFirmus=PAT.base;
	~harmo=(); 	~mel=();
	~epp=EventPatternProxy(
		Pbind(\scale,Plazy{s[\seed].envir})
		.collect{arg ev; s[\harmo].putAll(ev); Rest()});
	~epp2=EventPatternProxy(
		Pbind(*s[\cantusFirmus].asPairs)
		.collect{arg ev; s[\mel].putAll(ev); Rest()}
	);
	~voix=Pbind( 
		\type, \appo,
	) <> Pfunc{s[\harmo].putAll(s[\mel])};
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
			}; res.putAll(v);
			s.localPut(k,res);
			/////////////////
			s.epp.isPlaying.not.if{s.epp.play};
			s.epp2.isPlaying.not.if{s.epp2.play};
			// play bass pattern if necessary
			Pdef(k,  res.asPattern <> s.voix )
			.quant_(s.quant)
			.play
		}
	)
}
