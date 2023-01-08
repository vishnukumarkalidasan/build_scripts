class HelloWorld {
    public static void main(String[] args) {
        int i = 2;
	System.err.println("Hello world: start workload");
	while (i > 0) { // Mchine code is not generaes
            workload(14, 2);
        }
    }

    private static int workload(int a, int b) {	
	//System.out.println("Hello world: from compiled workload");
        return a - b;
    }
}
