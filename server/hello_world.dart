import 'dart:async';
import 'package:vane/vane.dart';

class HelloWorld extends Vane {
  Future main() {
    if(query.containsKey("name")) {
      log.info("Greeting ${query["name"]}");
      close("Greetings ${query["name"]}");
    } else {
      log.info("Greeting the world");
      close("Greetings World!");  
    }
    
    return end;
  }
}

