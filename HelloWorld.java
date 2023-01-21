class HelloWorld {
    public static void main(String[] args) {
        int i = 10;
	int ret = 0;
	System.err.println("Hello world: start workload");
	while (--i > 0) { // Mchine code is not generaes
            ret += workload(14, i);
        }
	System.err.println(ret);
    }

    private static int workload(int a, int b) {	
	//System.out.println("Hello world: from compiled workload");
	int x = a * b;
	int z = x * 10;
        return z;
    }
}
