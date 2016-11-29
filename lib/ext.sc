+ EnvironmentRedirect{
	embedInStream{
		^this.envir.embedInStream
	}
	gui{ arg numItems=envir.size,parent,bounds,options;
		var g=envir.gui(numItems,parent,bounds,options);
		envir.kvdo{arg k,v;
			g.addAction(k,{this.dispatch.value(k,v)})
		};
		^g
	}
}


// matrix
+ ArrayedCollection{
	slicePut { arg f ... cuts;
		var tmp;
		if (cuts.size == 0) { ^this };
		if (cuts.size==1){
			cuts[0] ?? {cuts=this.size};
			try{cuts.do { |x| this.put(x,f.(this[x]))}}
			{"problème dans les cuts".warn}
		}{
			tmp=if(cuts[0]==nil){this}{this[cuts[0]]};
			tmp.do(_.slicePut(f,*cuts.drop(1)))
		};
		^this
		}
}