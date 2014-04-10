import 'dart:async';
import 'package:vane/vane.dart';

class HelloWorld extends Vane {
  Future main() {
    if(query.containsKey("name")) {
      log.info("Saying hello to ${query["name"]}");
      close("Hello ${query["name"]}");
    } else {
      log.info("Saying hello to the world");
      close("Hello World!");  
    }
    
    return end;
  }
}

