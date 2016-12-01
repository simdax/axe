EventTypes : APP {

	*initClass{
		Class.initClassTree(Event);
		this.filesDo({arg file;
			file.absolutePath.postln.load
		})
	}
}