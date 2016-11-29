// this is just a function that inject
// it cares also with ambitus management
{ arg un,p;
	p.put(\rea,Harmonie.rea);
	p.put(\go, { var res;
		~realisation=nil;
		~rea.rot=0; 
		res=~parcours.use{ arg s;
			var tmp=0;
			s.localPut(\dir, ~dir.extend(~list.size));
			~list.collect({|x,i|
				var io=tmp+x;
				tmp=tmp+if((io>~ambitus.maxItem)or:(io<~ambitus.minItem))
				{
					~dir.put(i,x.sign.neg);
					x-(x.sign*7); 
				}{
					~dir.put(i,x.sign);
					x;
				};
				tmp;
			})
		}.differentiate.addFirst(0);
		~squelette=res.collect(~rea.res(_));
		~squelette.inject([~accord],
			{arg a,b; ~realisation=~realisation.add(a.last+b)})
	}.inEnvir(un)
	);
}