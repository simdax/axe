+Event{
	put{ arg ... args; 
		args.clump(2).do(this.superPerformList(\put, _))
	}
}
