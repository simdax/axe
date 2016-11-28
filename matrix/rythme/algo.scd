{
	arg legato=[1,1.25,1.5];
	var onsets=(legato).integrate;
	var tourne=0; 	var r;
	// tournerie
	//r{
	while{onsets.last.isRound.not}{
			tourne=tourne+1;
			//0.5.wait;
		onsets=((legato!(tourne+1)).reduce{arg a,b; a++b}).integrate;
		//		onsets.last.dump
	};
	//	}.play;
	onsets.last.do { |count|
		var res=onsets.addFirst(0).select{arg x; x.asInt==count};
		res.size.switch(
			0, {r=r.add([\rest,0])},
			{r=r.add([
				\note!res.size,
				res.collect({|x| x-x.asInt })
			])}
		)
	};
	r.collect(_.flatten)
}//.([1,1.5])

