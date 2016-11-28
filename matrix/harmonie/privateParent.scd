{ arg un;
	var p=un.envir.parent;// calcul du bignou
	p.put(\go, {
		~res=nil;
		~squelette=~parcours.list.collect{ arg x;
		Harmonie.rea.res(x)
		};
		~squelette.inject([~accord],
			{arg a,b; ~res=~res.add(a.last+b)})
	}.inEnvir(un)
	);
	Harmonie.guigui(p,un);
	// object qui calcule le squelette
	p.put(\parcours,Harmonie.parcoursEnv(un) );
}