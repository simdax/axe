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
	// private
	f:f,
	res:{arg s;
		s.list=s.f.joe(s.f[\k].(s.args).flat,s.swing) * s.time
	},
	// interface
	time:4, args:[[3,3,2],[[1,1],[1,2],1]], swing:[1],
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
			res.yield; s.coun=s.coun+1;
		}}.embedInStream(in);  in
	},
))
.dispatch_{arg k,v;
	var size=a.list.size;
	[\time,\args,\swing].includes(k).if{
		a.res; if(a.list.size>size){a.coun=0}
	};
};
a
)






