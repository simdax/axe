+ EnvironmentRedirect{
	put { arg key, obj;
		envir.put(key, obj);
		dispatch.value(key, obj, envir);
	}
}

