MyLazyEnvir : LazyEnvir {

	var <>changedDispatch;
	// the changed Dispatch id usefull to
	// value only if the obj is changed

	choose{this.subclassResponsibility(\choose)}
	// We add a choose
	//	atChoose{this.subclassResponsibility(\choose)}
	put { arg key, obj;
		var proxy=this.choose(obj);
		changedDispatch.value(key,this.at(key).source,proxy);
		this.at(key).source_(proxy);
		dispatch.value(key, proxy);
		^this.at(key)
	}
	localPut { arg key, obj;
		var proxy=this.choose(obj);
		this.at(key).source_(proxy);
	}

}


MyPPE : MyLazyEnvir{
	<>{
		^envir.as(Event)
	}
	asPattern{
		^Pbind(*envir.asPairs)
	}
	printOn{ arg stream;
		stream << "PPE : " <<Char.nl;
		envir.kvdo { |k,v| 
			stream << k << " : " << v.source << Char.nl
		}
	}
	*new{^super.new.proxyClass_(\PatternProxy).know_(true)}
	choose{ arg t;
		^t.class.switch(
			// overwrite "embedInStream"
			Event, {Plazy{t}},
			EnvironmentRedirect, {Plazy{t}},
			// function
			Pattern,{Plazy{t}},
			Function,{Pfunc{t}},
			// list
			Array, {Pseq(t,inf)},
			String, {
				Pseq(t.collectAs(_.asSymbol,Array), inf)
			},
			//
			Symbol, {Pn(t)},
			//
			{t}
			//	Ref, t.value,
		)
	}
}
