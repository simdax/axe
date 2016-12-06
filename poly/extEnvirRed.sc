ER : EnvironmentRedirect{
	*new{ arg f,d,init=false;
		var res=super.new;
		res.make(f).dispatch_({
			().make(d.inEnvir(res.envir))
			.kvdo {arg k,v; this.localPut(k,v) };
		}).know_(true);
		if(init){res.dispatch.value};
		^res
	}
	asStream{
		^envir[\asStream].value(this) ?? {"no 'asstream".warn; this}
	}
}

+ EnvironmentRedirect{
	put { arg key, obj;
		envir.put(key, obj);
		dispatch.value(key, obj, envir);
	}
}

