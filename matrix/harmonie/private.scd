// all private FUNCS

{ arg un;
	var p=un.envir.parent;
	Harmonie.injectFunc(un,p);
	p.put(\parcours,Harmonie.parcoursEnv(un) );
	Harmonie.embed(un,p);
	Harmonie.guigui(p,un);
}