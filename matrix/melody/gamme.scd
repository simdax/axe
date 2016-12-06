(
var win=MyFlowView(bounds:800@320);
var a, refresh;
a=ER({ arg s;
	~list=[]; //~specs=((resolution:[1,12,0]));
	~nb=[6,8];
	~resolution=12; ~maxInter=3;
},{
	~list=~resolution.asInt.allPartitions;
	refresh.value
});
refresh={
	var l=~list.drop(1);
	win.children[1..].do(_.remove);
	win.reflowAll;
	win.view.decorator.nextLine;
	l.collect(_.size).as(OrderedIdentitySet).do{ |x|
		var io=EZListView(win, 100@100,"");
		io.items_(
			{
				var items=l.select({|y| y.size==x})
				.collect(_.asString);
				items.collect(_.size)
				.do(io.labelView.string_(
					(""++x++" : "++_.value)
				));
				items
			}.value)
	}
}.inEnvir(a);

a.gui(parent:win);

)

a=nil
