(
a=BoxGrid(rows:8, columns:8);
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
~setDiag={arg rows, cols,f;
	var indices=rows+++cols; 
	indices.do { |xy| f.value(a.gridNodes.slice(xy[0],xy[1]))};
	a.refresh;
};
~setIndices={arg rows, cols;
	~setDiag.(rows, cols, {arg x; x.state=true})
};//.inEnvir(s);
~produceMels={
	b={{{8.rand} ! 8} ! 3};
	whileCatch({
		c=b.value;
		// all differents
		(c.flop.every{arg x; x.asSet.size==3}.not)
		and:
		// no repeats
		((c.size - c.asSet.size) < 1 )
	},{},200);
	c
};
~colorizeMatrix={ arg mels= ~produceMels.();
	a.clearGrid;
	mels.do { |array|
	var color=Color.rand; 
	~setRevDiag.(array, (..array.size-1),
		{arg x; x.setColor_(color) ;x.state=true; }
	);
};
}//.inEnvir(s)
)

// a.clearGrid
// ~colorizeMatrix.()

// ~colorizeMatrix={
// ~produceMels.().do { |array|
// 	var color=Color.rand; 
// 	~setRevDiag.(array, (..array.size-1),
// 		{arg x; x.setColor_(color) ;x.state=true; }
// 	);
// };



