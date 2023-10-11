package pk1;

public aspect TraceAspect_Edmonds {
	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	//ANSWER:
	//pointcut constructorToTrace(): classToTrace() && execution(new(..));
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace(){
		String info = thisJoinPointStaticPart.getSignature() + ", " //
		        + thisJoinPointStaticPart.getSourceLocation().getLine();
	    System.out.println("[BGN] " + info);
	}
	
	after(): methodToTrace(){
		String info = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("[END] "+info);
	}
	//
}
