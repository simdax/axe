// generates a placeholder for voices
EnvironmentRedirect().make{ arg s;
	~default={
		// default keys TODO make "default"
		~instrument=\cheappiano;
	}; 
	~seed=Harmonie.mat.g; ~cantusFirmus=PAT.base;
	~quant=4;	~vv=();
	~forward={arg s, sel ... args;
		sel.switch(
			\list,{s.vv.keys.postln},
			{ s.vv.at(sel) ?? {"rien mec".warn} }
		)
	};
	~play=	Plambda(
		Ppar([
			Plet(\bouzin,Pbind(
				\type, \rest,
				[\degree,\dur],
				Pbind(*s[\cantusFirmus].asPairs).collect(_.values),
				\arpege, p{ arg in;
					var accord=s[\seed].asStream;
					var n={accord.next};
					// yield first
					loop{in=n.value.yield};
					// loop{
					// 	if(n.includes(in.degree).not){
							
					// 	}{
							
					// 	}
					// }
				},
			)),
			Plazy
			{ arg in; 
				Ppar(s[\vv]).finDur(s.quant)
			}.repeat <>
			Pbind(\type, \note) <> Pget(\bouzin,(),inf)
		])
	);	
}.know_(true)
.dispatch_{arg k,v,s;
	k.switch(
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
