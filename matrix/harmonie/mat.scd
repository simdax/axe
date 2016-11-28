(a=LazyEnvir()
.know_(true).make{ arg un;
	var p=un.envir.parent;
	~accord=[0,2,4]; ~depart=0; p.put(\res,[]);
	// PRIVATE
	p.put(\specs,(depart:[0,6,0,1]));
	Harmonie.private(un);
}
.dispatch_({ arg k,v,s; 
	a.use{k.switch(
		//		\depart, {a.parcours}
		\bob, {}, \res, {}, {
	}
	)}
});
)