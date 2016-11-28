().make{ arg s;
// the grammatical base => one step = one harmonic third above
~baseMvt=(-2);
// nb of notes for one chord (only 3 or 4)
~sst=3;
// we need an internal state
~rot=0;
////////////PR
// TODO, link with baseMvt
~rotate={arg n; 
	~rot=(~rot+(n%3).neg)
};
////////// PUBLIC
~res={ arg s,nb;
	var a=0!~sst;
	nb.abs.do { |x| a[x%3] = a[x%3]+1 };
	(nb.sign==1).not.if{a=a*(-1)}{
		a=a.reverse
	};
	a=a.rotate(~rot);
	~rotate.(nb);
	a
}.inEnvir(s);
}
