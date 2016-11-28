+ Float {
	isRound{ arg prec=1;
		var t=this.asStringPrec(2+prec);
		^t.drop(2).every(_==$0)
		//		^(0 == (this.floor.postln - this.postln))
	}	
}

+ Integer {
	isRound {^true}
}


