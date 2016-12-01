// generates a placeholder for voices
EnvironmentRedirect().make{ arg s;
	// default keys TODO make "default"
	~chrono=Ptime().asStream;
	~default=(instrument:\cheappiano);
	~def=Pbind(\type, \appo);
	~seed=Harmonie.mat.g; ~cantusFirmus=PAT.base.g;
	~time=4; ~repeats=inf; ~reset=true; ~playing=false;
	~vv=(); ~durHarmo=1; 
	~forward={arg s, sel ... args;
		if(sel==\ppar){}
		{sel.switch(
			\list,{s.vv.keys.postln},
			{ s.vv.at(sel) ?? { 
				s.use{s.proto.at(sel).value(*args)} ??
				{"rien mec".warn; nil}
			} }
		)}
	};
	~pattern={ arg s,reset=false;
		s.chrono.next; 
		if(s[\vv].isEmpty){s.put(\test, (type: \note))};		
		if(reset or: (s[\ppar].isNil))
		{
			s[\ppar]=MyPtpar(s[\vv].values.collect([0,_]).flat);
		};
		s[\playing]=true;
		p{ arg in;
			var stream=
			Plazy{Plambda(
				Ppar([
					// the skeleton
					Plet(\harmo,
						Pbind(
							\type, \rest,
							\arpege, Pstep(
								Pn(s[\seed]) , Pfunc{s[\durHarmo]}
							),
							[\degree,\dur],
							Plazy(s[\cantusFirmus]).collect(_.values),
						)),
					// the main collector
					s[\ppar] <> Plazy{s[\def]} <> Pget(\harmo,(), inf)
				])
			)}.asStream;
			var chrono=Ptime().asStream;
			if(s[\reset]){s[\seed].coun=0;
				s[\cantusFirmus].reSet;
			};
		while{chrono.next<s.time}{in=stream.next.yield};
	}.repeat(s.repeats)
};	
}.know_(true)
.dispatch_{arg k,v,s;
	k.switch(
\durHarmo, {}, \ppar, {}, \playing, {},
\time,{
	if(v==0){
		"dangerous ?".warn; s.localPut(k,1)
	};
	if(s[\reset]){s[\seed].coun=0;s[\cantusFirmus].reSet; \io.postln};
},{
	if(s.vv.at(k).notNil){
		s.vv.at(k).pattern.pairs=[];
		s.vv.at(k).putAll(s[\default]++v)
	}{
		var res=MyPPE.newFrom(s[\default]++v);
		s.vv.put(k,res);
		if(s[\playing]){s[\ppar].put(s.chrono.next, res.asPattern)}
	};
	// do not record it in envir
	// so we forward and no need to do "object.vv.voice"
	s.localPut(k,nil);
}
)
}
