(
// core Funcs
var f=(
k:{arg zzz;
	zzz.collect{arg x; if(x.isCollection)
		{x.deepCollect(x.maxDepth-1,{arg x; x.asArray.ns})}{x}}
	.flop
	.collect(_.reduce('*'))
},
bob:{arg z; z.ns.collect(z.mean*_)},
joe:{arg s,a,b; (a * s[\bob].(b)).ns * a.sum }
);

// object
var a=EnvironmentRedirect().envir_((
	list:[],
	// public
	time:4, args:[], swing:[1],
	seed:{3.xrand}, decoupe:[3,2]
).parent_((
	g:{arg s;
		s.gui; s
	},
	f:f,
	res:{arg s; s.use{
		~args.isEmpty.if {s.localPut(\args,~seed ! ~decoupe)};
		~list=f.joe(f[\k].(~args.postln).flat,~swing) * ~time
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
		s.list ?? {s.res}; s.parent.coun=0;
		p{ var res; while{res=(s.list @ s.coun); res.notNil}{
			res.yield; s.parent.coun=s.coun+1;
		}}.embedInStream(in);  in
	},
)))
.dispatch_{arg k,v;
	var size=a.list.size;
	[\decoupe, \seed].includes(k).if{a.args=[]};
	[\time,\args,\swing,\decoupe,\seed].includes(k).if{
		a.res; if(a.list.size>size){a.envir.parent.coun=0}
	};
};
a
)






