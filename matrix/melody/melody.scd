(
// functions helper
var f=(
	inv:{arg x; x.asBoolean.not.asInt},
	convert:{arg s, mel; mel.collect({|x|
		x.asBinaryDigits(3)
	}).flop
	}
);

// main object
var a=(
	//// INTERFACE
	rows:3,cols:8,  genSeed:{2.rand}, puissance:2,
	//// PRIVATE
	doMatrix:{arg s; s.use{
		~matrix=  ~mel !? {f.convert(~mel)}
		?? { ~genSeed ! [~rows, ~cols]} 
	}; s},
	setMatrix:{arg s,val,row,col;
		if(val.class==Symbol){val=f[val]};
		s.use{ ~matrix.slicePut(val,row,col) }; s.res;
	},
	sstructure: {arg s; s.use{(~puissance.pow(_)) ! ~rows}},
	res:{arg s;  s.use{
		~matrix ?? {s.doMatrix};
		~list=( ~matrix * s.sstructure).sum
	}}
);
// PRIVATE
EnvironmentRedirect().envir_(a.putAll((
	// GUI
	g:PAT.melodyGui,
		// embedding
	coun:0,
	embedInStream:{arg s, in;
		s.list ?? {s.res}; s.coun=0;
		p{ var res; while{res=(s.list @ s.coun); res.notNil}
			{in=res.yield; s.coun=s.coun+1;}
		}.embedInStream(in); in
	},
)))
.dispatch_{arg k,v;
	var size=a.list.size;
	k.switch(
		\matrix, {a.res}
	);
	[\puissance].includes(k).if{
		"dispatché".postln;
		//update
		a.doMatrix; a.res; 
		if(a.list.size>size){a.coun=0}
	}
}
)
