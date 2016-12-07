(
coun:0, defVal:0,
embedInStream:{arg s,in;
	p{
	loop{
		var r=(s.at(\list) @ s.coun);
		r ?? {s.parent.coun=0; r=(s.at(\list) @ s.coun)};
		in=(r?s.defVal).yield;
		s.parent.coun=s.coun+1;
	}
	}.embedInStream(in)
},
asStream:{ arg s; 
	Plazy(s).asStream
}
)

