+ Object{
	whileCatch { arg body, times=100, catchError={Error("no solution").throw};
		var i=0;
		while({ this.value }, {
			body.value;
			if(i>times){^catchError.value};
			i=i+1;
		});
	}

}