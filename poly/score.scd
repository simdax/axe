// nb de notes en même temps
// nb 

().know_(true).make{ arg self;
~g={arg s,w,b; s.items.gui(parent:w,bounds:b); s};
~items=ER({
	~res=[];
	~nbVoix=6; ~seedMel={5.rand}; ~seedRythme=3;
}, {
	~nbVoix=~seedRythme.xrand;
	~res=~seedMel!~nbVoix
});
~io=().parent_(~items.envir);
~res={
	var dicts=self.rotations.value.collect{arg x;
		(
			degree:self.mel.value.rotate(x),
			rythme:self.rythme.value.rotate(x)
		)
	};
	currentEnvironment.postln;
	dicts.collect{|dict, ind|
		~vv.put(ind.asSymbol,dict)
	}
}
}

