{ arg un,p;
	un.coun=0;
	p.embedInStream={arg s, in=();
		p{	loop{
			var r=(un.realisation @@ un.coun);
			un.coun=un.coun+1;
			defer{un.listGuiReal.value_(un.coun%un.listGuiReal.items.size)};
			defer{un.listGuiNotes.value_(un.coun%un.listGuiNotes.items.size)};
			in=(r?[0,2,4]).yield
		}}.embedInStream(in)
	}
}