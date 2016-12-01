// generates a placeholder for voices
EnvironmentRedirect().make{ arg s;
	// default keys TODO make "default"
	~default=(instrument:\cheappiano);
	~def=Pbind(\type, \note);
	~seed=Harmonie.mat.g; ~cantusFirmus=PAT.base.g;
	~time=4; ~repeats=inf; ~reset=true;
	~vv=(); ~durHarmo=1;
	~forward={arg s, sel ... args;
		sel.switch(
			\list,{s.vv.keys.postln},
			{ s.vv.at(sel) ?? { 
				s.postln.use{s.proto.at(sel).value(*args)} ?? {"rien mec".warn}
			} }
		)
	};
	~pattern={
		Plambda(
			Ppar([
				Plet(\harmo,
					Pbind(
						\type, \rest,
						\arpege, Pstep(
							Pn(s[\seed]) , Pfunc{s[\durHarmo]}
						),
						[\degree,\dur],
						Plazy{s[\cantusFirmus]}.collect(_.values),
					)),				
				Ppar(s[\vv]) <> Plazy{s[\def]} <>
				Pget(\harmo,(), inf)
			])
		)			// home made pfindur (adaptative)
		.collect(r{arg in;
			var chrono=Ptime().asStream;
			if(s[\reset]){s[\seed].coun=0;s[\cantusFirmus].reSet; \io.postln};
			while{chrono.next<s.time}{in=in.yield};
			"bye".postln; 
		}.repeat(s.repeats.postln))
	};	
}.know_(true)
.dispatch_{arg k,v,s;
	k.switch(
		\durHarmo, {},
		\time,{
			if(v==0){"dangerous ?".warn; s.localPut(k,1)}
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
