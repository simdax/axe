{{arg s, win=Window().front, b=300@300;
	var a=View(win,b).layout_(GridLayout());
	s.matrix.do{ arg row,i;
		// checkboxes
		row.do{arg x,j; a.layout.add(
			CheckBox().value_(x.asBoolean)
			.action_{
				s.matrix.postln;
				s.setMatrix(\inv,i.asArray,j);
				s.matrix.postln}
			,i,j
		)};
		//boutons à la fin
		a.layout.add(Button().action_{
			a.children[(row.size+1)*i..(row.size*(i+1))]
			.do { |cBox| if(cBox.class!=Button)
				{cBox.valueAction_(cBox.value.not)}}
		},i,row.size);
	};
	// petits boutons en plus
	({arg y; {arg x ; x*(8+1) + y } ! 3} !8).do { |cols,ind| 
		a.layout.add(Button()
			.action_{
				a.children.at(cols).do { |cBox|
					cBox.valueAction_(cBox.value.not)}
			},
			3, ind)
	};
	// puissance
	EZNumber(a, Rect(0,0,20,20),controlSpec:[1,3,0,1])
	.value_(2)
	.action_{arg sel; s.puissance=sel.value};
	s
}}