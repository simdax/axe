{arg p,un;	//gui
	p.put(\g,{ arg s,par=FlowView(bounds:300@400),b;
		un.parcours.gui(parent:par);
		un.gui(parent:par);
		p.put(\listGuiReal,EZListView(par,bounds:80@170));
		p.put(\listGuiNotes,EZListView(par,bounds:80@170));
	});
}