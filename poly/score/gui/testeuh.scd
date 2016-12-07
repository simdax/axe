(
var container=Window("io", Rect(30, 30, 450, 250)).front;
var a=BoxGrid(container,rows:8, columns:8);
~get={
	a.gridNodes.collect(_.select(_.state))
};
~setMatrice={ arg rows,cols;
	a.gridNodes.slice(rows, cols)
	.deepDo(2, { |x| x.state=true });
	a.refresh
};
~setRevDiag={arg rows, cols,f;
	var indices=rows+++cols;
	indices.do { |xy| f.value(a.gridNodes.reverse.slice(xy[0],xy[1]))};
	a.refresh;
};
~mels_={arg val; ~mels=val };
//~addMel={arg val; ~mels=~mels.addval };
~setDiag={arg rows, cols,f;
	var indices=rows+++cols; 
	indices.do { |xy| f.value(a.gridNodes.slice(xy[0],xy[1]))};
	a.refresh;
};
~setIndices={arg rows, cols;
	~setDiag.(rows, cols, {arg x; x.state=true})
};
~produceMels={
	var c; 	var b={{{8.rand} ! 8} ! 3};
	~clear.(); 
	whileCatch({
		c=b.value;
		// all differents
		(c.flop.every{arg x; x.asSet.size==3}.not)
		and:
		// no repeats
		((c.size - c.asSet.size) < 1 )
	},{},200);
	~mels=c;
};
~resetM={ arg r,c;
	container.view.removeAll;
	a=BoxGrid(container,rows:r, columns:c)
};
~clear={a.clearGrid};

// ~mels_={ arg val; val.postln;
// 	~mels=val; "fdsfsq".postln
// };
~colorizeMatrix={ arg mels;
	mels !? {~mels=~mels.add(mels)};
	~mels ?? {~produceMels.value()};
	if(~mels.rank==1){~mels.bubble}{~mels}
	.do { |array|
		var color=Color.rand; 
		~setRevDiag.value(array, (..array.size-1),
			{arg x; x.setColor_(color) ;x.state=true; }
		);
	};
}
)


~colorizeMatrix.()
