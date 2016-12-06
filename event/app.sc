EventTypes : APP {

	*initClass{
		Class.initClassTree(Event);
		StartUp.add{
			this.filesDo({arg file;
				file.absolutePath.load
			})}
	}

}