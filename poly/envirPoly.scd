// generates a placeholder for voices
EnvironmentRedirect().make{ arg s;
	// default keys TODO make "default"
	~default=(instrument:\cheappiano);
	~def=Pbind(\type, \note,\instrument, \cheappiano);
	~seed=Harmonie.mat.g; ~cantusFirmus=PAT.base;
	~time=4;	~vv=(); ~durHarmo=1;
	~forward={arg s, sel ... args;
		sel.switch(
			\list,{s.vv.keys.postln},
			{ s.vv.at(sel) ?? { 
				s.postln.use{s.proto.at(sel).value(*args)} ?? {"rien mec".warn}
			} }
		)
	};
	~pattern={	Plambda(
		Ppar([
			Plet(\harmo,
				Pbind(
					\type, \rest,
					\arpege, Pstep(
						Pn(s[\seed]) , Pfunc{s[\durHarmo]}
					),
					[\degree,\dur],
					Pbind(*s[\cantusFirmus].asPairs).collect(_.values),
				)),				
			Ppar(s[\vv]).trace
			// home made pfindur (adaptative)
			.collect(r{arg in;
				var chrono=Ptime().asStream;
				while{chrono.next<s.time}{in=in.yield};
				"bye".postln; nil.yield
			}).repeat <>
			Plazy
			{s[\def]} <>
			Pget(\harmo,(), inf)
		]) 
	)};	
}.know_(true)
.dispatch_{arg k,v,s;
k.switch(
	\durHarmo, {},
	\time,{ // TODO big trc a faire la...
		// s.kvdo{arg k,v;
		// 	Pdef(k).align(v)
		// }
	},{
		if(s.vv.at(k).notNil){
			s.vv.at(k).pattern.pairs=[];
			s.vv.at(k).putAll(s[\default]++v)
		}{
			var res=MyPPE.newFrom(s[\default]++v);
			s.vv.put(k,res);
		};
		// do not record it in envir
		// so we forward and no need to do "object.vv.voice"
		s.localPut(k,nil);
	}
)
}
