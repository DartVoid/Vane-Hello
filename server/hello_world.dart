import 'dart:async';
import 'package:vane/vane.dart';

class HelloWorld extends Vane {
  Future main() {
    if(query.containsKey("name")) {
      close("Hello ${query["name"]}");
    } else {
      close("Hello World!");  
    }
    
    return end;
  }
}

