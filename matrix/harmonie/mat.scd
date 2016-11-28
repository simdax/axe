(a=LazyEnvir()
.know_(true).make{ arg un;
	var p=un.envir.parent;
	~accord=[0,2,4]; ~depart=0; p.putAll((res:[]));
	// PRIVATE
	p.put(\specs,(depart:[0,6,0,1]));
	Harmonie.privateParent(un);
	Harmonie.embed(un,p);
}
.dispatch_({ arg k,v,s; 
	a.use{k.switch(
		//		\depart, {a.parcours}
		\bob, {}, \res, {}, {
	}
	)}
});
)