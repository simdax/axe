///PUBLIC
//in this case, it generates a routine of itself with first arg
().make{
~base=(-2);
~newVec={arg s, vecs;
	var r=s.deepCopy;
	r.put(
		\vecs, vecs, // always add 0 at the beg
		\embedInStream,{ arg s, in=(); 
			p{var v=s.vecs.iter.repeat; 
				loop{in=s.res(v.next).yield}
			}.embedInStream(in)
		}
	);
}.inEnvir(s);
~newDegree={arg s, vecs;
	s.newVec((vecs.differentiate*~base).addFirst(0))
}.inEnvir(s)
}