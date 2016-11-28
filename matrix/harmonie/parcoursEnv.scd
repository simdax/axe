{arg un;
	EnvironmentRedirect().make{ arg deux;
		deux.envir.parent.put(\specs,
			(nb:[3,8,0,1],sommeVecteurs:[0,7,0,1])
		);
		~base=(-2); ~sommeVecteurs=0; ~nb=4; ~ambitus=[-3,3];
		~vecteurs=[-3,-2,-1,0,1,2,3]; ~wVec=[0,0,0,0,2,2,1];
		~nop=[6]; ~list=[un[\depart]];
		~dir=1!~nb;
		// "private"
		deux.envir.parent.put(\p, {var a, i=0; while{
			if(i>100){"pas de solution".warn; a=[0]; false}
			{a={~vecteurs
				.wchoose(
				~wVec.wrapExtend(~vecteurs.size).normalizeSum
			)
			} ! ~nb;
			((a.sum%7) != ~sommeVecteurs)
			or: (((a.integrate*~base)%7).includesAny(~nop).not)}
		}{i=i+1};
			~list=a}.inEnvir(deux)
		);
	}
	.know_(true).dispatch_({arg k,v;  switch(k,
		// "private"
		\list, {}, \p, {}, 
		{
			un.use{
				switch(k, \nb,
					{~parcours.dir=~parcours.dir.wrapExtend(v)}
				);
			~parcours.p; ~go.value;
			//gui
			~listGuiReal.items_(un.realisation.collect(_.asString));
			~listGuiNotes.items_(un.squelette.collect(_.asString))}
		},
	)})
}