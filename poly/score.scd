().know_(true).make{ arg self;
	~nbVoix=6; ~mel={{5.rand}!8}; ~rythme=[1];
	~rotations={{8.rand} ! 6};
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

