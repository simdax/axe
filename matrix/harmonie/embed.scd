{ arg un,p;
	un.coun=0;
	p.embedInStream={arg s, in=();
		p{	loop{ 	
			var r=(un.realisation @@ un.coun);
			un.coun=un.coun+1;
			in=(r?[0,2,4]).yield
		}}.embedInStream(in)
	}
}