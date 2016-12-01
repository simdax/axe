(
// core Funcs
var f=(
	k:{arg s,zzz;
		zzz.collect{arg x; if(x.isCollection)
			{x.deepCollect(x.maxDepth-1,{arg x; x.asArray.ns})}{x}}
		.flop
		.collect(_.reduce('*'))
	},
	bob:{arg s,z; z.ns.collect(z.mean*_)},
	swingify:{arg s,a,b; (a * s.bob(b)).ns * a.sum },
	go:{arg s, args, swing; s.swingify(s.k(args),swing)}
);

// object
var a=EnvironmentRedirect().envir_((
	list:[],
	// public
	time:4, args:[], swing:[1],
	round:1,quantize:1, strength:0,
	seed:{3.xrand}, decoupe:[2,[4,4]]
).parent_((
	specs:(quantize:[0,1,5],strength:\unipolar,round:[0.001,2]),
	g:RYTHME.guigui,	f:f,
	gen:{~decoupe.collect{ arg c; var f=thisFunction;
		if(c.isCollection){
			c.collect(f.(_))
		}{~seed !c}
	}},
	res:{arg s; s.use{
		~args.isEmpty.if {s.localPut(\args,~gen.())};
		~list=f.go(~args,~swing) * ~time;
		~list=~list.flatten;
		~list=~list.collect({|x| 
			x.quantize(~round,~quantize,~strength)
			.round(0.01)
		});  try{~meanGui.value_(~list.mean.postln)}
	}; s},
	// interface
	setArgs:{arg s,level,val; s.args[level]=val; s.res},
	setArgsGlobal:{arg s,val; s.args=s.args+val; s.res},
	setArgsRecursiv:{ arg s,val,level;
		var a = level.collect{arg x; val ! (x+1)};
		a[0]=a[0].flatten;
		s.args=a;
	},
	// embedding
	coun:0,
	embedInStream:{arg s, in;
		s.list ?? {s.res}; s.coun=0;
		p{ var res; while{res=(s.list @ s.coun); res.notNil}{
			res.yield;
			s.coun=s.coun+1; 
		}}.embedInStream(in);  
	},
)))
.dispatch_{arg k,v; 
	var size=a.list.size;//k.postln;
	[\decoupe, \seed].includes(k).if{a.args=[]};
	[\time,\args,\swing,\decoupe,\seed,
		\strength,\quantize,\round].includes(k).if{
		a.res;
		//embedding
		if(a.list.size>size){a.envir.parent.coun=0}
	};
};
a
)






