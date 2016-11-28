MyEnvirGui : EnvirGui {}

+ MyEnvirGui
{
	*new { |object, numItems = 8, parent, bounds, makeSkip = true, options = #[]|
		^super.new(object, numItems, parent, bounds, makeSkip = true, options).initDeux;
	}
	initDeux{
		try{
			object[\specs].collect(_.asSpec).kvdo { |key,spec|
				this.putSpec(key,spec)
			};
			//			this.hideFields(\specs)
		}
	}
	
	hideFields{arg ...fields;
		var ind=paramViews.collect { |x, i|
			//side effect
			if(fields.includes(x.label)){
				x.visible_(false)
			};
			i
		};
		//// FEINTE LIKE ITS NOT USED
		useRanger=fields;
	}
	showFields { |num = 0|
		paramViews.do { |pv, i|
			var isInUse = (i < num) ;
			pv.visible_(isInUse);
		};
		try{this.hideFields(*useRanger)};
	}

	doesNotUnderstand{ arg selector;
		^this.viewForParam(selector)
	}
	keys{
		^this.paramViews.collect(_.label)
	}
	addAction{arg label,func;
		var v=this.viewForParam(label);
		var a=v.action;
		v.action=v.action.addFunc(func);
		^v
	}
}


+ Dictionary {
	/*
	*/
	gui { arg  numItems, parent, bounds, options;
		var n = numItems ?? { max(12, this.size) } ;
		^MyEnvirGui(this, n, parent, bounds, options:options);
	}
}
