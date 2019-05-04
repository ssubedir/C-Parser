import java.io.*;
import java_cup.runtime.Symbol;

class Main {
  public static void main(String[] args) throws Exception {
       File inputFile = new File (args[0]);
       A5Parser parser= new A4Parser(new A4JF(new FileReader(inputFile)));
       String result = (String)parser.debug_parse().value;
       result = result.replace("return 0;","");
       String outputFileName = args[0].replaceAll("input.c","output.java");
       String className = args[0].replaceAll("input.c","output.java").replace(".java","");
       result = result.replaceAll("F1L3N4M3",className);
       FileWriter fw = new FileWriter(new File(outputFileName));
       fw.write(result);
       fw.close();
  }
}