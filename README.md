the provided scripts are bash scripts. perform 'chmod +x <script>' before execution or use 'bash' command.


execute labsjdk_cpp-Intrptr_setup_<target>.sh for zero interpreter (cpp interpreter) for live debugging of interpretation in runtime. zero interpreter does not use the assembler. it does inline interpretation which means it is not specific to any target and disables compilation of mehtods (disables machine code generation).

execute helloworld using normal commands.

javac HelloWorld.java -> for compilation

java HelloWorld -> execution. prints lots of debug messages from the interpreter for each method being interpreted.

--------------------------------------------------------------------------------

execute labsjdk_temp-Intrptr_setup_<target>.sh for template interpreter. this is the default interpreter. here interpreter is generated in runtime and debugging interpreter is difficult here as the interpreter is seperately generated in assembly. it also has inline bytecode function and bytecode definitions generated in assembly. it runs like normal interpreter and supports compilation. compiled methods will be added to codecache.

javac HelloWorld.java -> for compilation

java HelloWorld -> execution

add options '-XX:+UnlockDiagnosticVMOptions -XX:+PrintInterpreter' for printing the interpreter. also add '-XX:+PrintAssembly' for printing the native compiled methods.
