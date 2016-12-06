+ Event{
	asStream{
		^if(this[\asStream].notNil){
			this[\asStream].value(this)
		}{
			this.superPerform(\asStream)
		}
	}
}