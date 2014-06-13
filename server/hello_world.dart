import 'dart:async';
import 'package:vane/vane.dart';

class HelloWorld extends Vane {
  Future main() {
    if(query.containsKey("msg")) {
      log.info("Saying hello to ${query["msg"]}");
      close("Hello ${query["msg"]}");
    } else {
      log.info("Saying hello to the world");
      close("Hello World!");  
    }
    
    return end;
  }
}

