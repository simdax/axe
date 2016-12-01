// generates a placeholder for voices
EnvironmentRedirect().make{ arg s;
	//	s.put('proto_',{arg s,dict; s.proto_(dict)})
	~default={
		// default keys TODO make "default"
		~instrument=\cheappiano;
	}; ~def=Pbind(\type, \note,\instrument, \cheappiano);
	~seed=Harmonie.mat.g; ~cantusFirmus=PAT.base;
	~quant=4;	~vv=(); ~durHarmo=1;
	~forward={arg s, sel ... args;
		sel.switch(
			\list,{s.vv.keys.postln},
			{ s.vv.at(sel) ?? { 
				s.postln.use{s.proto.at(sel).value(*args)} ?? {"rien mec".warn}
			} }
		)
	};
	~pattern=	Plambda(
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
			Plazy
			{ arg in;
				Ppar(s[\vv]).finDur(s.quant).trace
			}.repeat <> 
			Plazy{s[\def]} <>
			Pget(\harmo,(), inf)
		]) 
	);	
}.know_(true)
.dispatch_{arg k,v,s;
	k.switch(
		\durHarmo, {},
		\quant,{ // TODO big trc a faire la...
			// s.kvdo{arg k,v;
			// 	Pdef(k).align(v)
			// }
		},{
			if(s.vv.at(k).isNil){
				var res=MyPPE().make(s[\default]).putAll(v); 
				s.vv.put(k,res)
			}{
				s.vv.at(k).putAll(v);
			};
			// do not record it in envir
			s.localPut(k,nil)
		}
	)
}
