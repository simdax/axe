(
coun:0, defVal:0,
embedInStream:{arg s,in;
	p{
	loop{
		var r=(s.at(\list) @ s.coun);
		r ?? {s.coun=0; r=(s.at(\list) @ s.coun)};
		in=(r?s.defVal).yield;
		s.coun=s.coun+1;
	}
	}.embedInStream(in)
},
asStream:{ arg s; s.postln;
	Plazy(s).asStream
}
)