{
	var a=
	ER({
	~shape=[]; ~list=[];
	~inter=[-2,2];
	~xcludeInt=[0];
	~ambitus=(3..10).choose; ~nb=(3..8).choose;
},{
	~shape= {[-1,1].choose} ! ~nb;
	~list=({(~inter.minItem..~inter.maxItem).removing(~xcludeInt).choose} ! ~nb)
	.integrate
},	true // init
	);
	a.envir.parent_(
		PAT.listStream
	);
	a	
}
