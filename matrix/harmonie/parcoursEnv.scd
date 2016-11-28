{arg un;
	EnvironmentRedirect().make{ arg deux;
		deux.envir.parent.put(\specs,
			(nb:[3,8,0,1],sommeVecteurs:[0,7,0,1])
		);
		~sommeVecteurs=0; ~nb=4;
		~vecteurs=[1,2,3]; ~wVec=[1];
		~nop=[6]; ~list=[un[\depart]];
		// "private"
		deux.envir.parent.put(\p, {var a, i=0; while{
			if(i>100){"pas de solution".warn; a=[0]; false}
			{a={~vecteurs
				.wchoose(
				~wVec.wrapExtend(~vecteurs.size).normalizeSum
			)
			} ! ~nb;
			((a.sum%7) != ~sommeVecteurs)
			or: ((a.integrate%7).includesAny(~nop).not)}
		}{i=i+1}; ~list=[un.depart]++a}.inEnvir(deux)
		);
	}.know_(true).dispatch_({arg k,v;  switch(k,
		// "private"
		\list, {}, \p, {},
		{
			un.parcours.p; un.go;
			//gui
			un.listGuiReal.items_(un.res.collect(_.asString));
			un.listGuiNotes.items_(un.squelette.collect(_.asString))
		},
	)})
}