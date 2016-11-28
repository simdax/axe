().make{ arg s;
~a=(0 ! 3); ~rot=0;
~convert={arg vec; -2*vec};
~addRot={arg s,n; s.use{
	~rot=n.switch(
		0,0,1,0,2,1,3,1,-3,-1,-2,-1,-1,0
	)
}};
~res={ arg s,nb;
	s.addRot(nb).postln;
	nb.abs.do { |x| ~a[x%3] = ~a[x%3]+1 };
	(nb.sign==1).not.if{~a=~a*(-1)}{
		~a=~a.reverse
	};
	~a
}.inEnvir(s)
}
