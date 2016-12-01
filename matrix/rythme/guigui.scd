{
	{arg s,win,b=400@150;
		var w=s.gui(parent:win,bounds: b);
		w.parent.bounds_(w.bounds+Rect(0,0,0,30));
		s.envir.parent.put(
			\meanGui,StaticText(w.parent,40@20).value_(s.mean)
		);
		s
	}
}