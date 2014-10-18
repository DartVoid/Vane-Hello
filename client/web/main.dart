import 'dart:html';
import 'package:http/browser_client.dart';

void main() {
  BrowserClient client      = new BrowserClient();
  ButtonElement formSubmit  = querySelector("#form-submit");
  InputElement formInput    = querySelector("#form-input");
  InputElement formClear    = querySelector("#form-clear");
  DivElement formResponse   = querySelector("#form-response");
  
  // Send message
  formSubmit.onClick.listen((Event e) {
    e.preventDefault(); // Prevent form submit
    formResponse.classes.add("well"); // Style output wrapper
    Uri url = Uri.parse("/hello/${formInput.value}"); // Construct the request url
    
    // Send request
    client.put(url).asStream().listen((response) {
      // Display response message
      formResponse.append(
        new ParagraphElement()..text = "${response.body}"
      ); 
      // Catch errors
    }).onError((e) {
      // Display an error message
      formResponse.append(
        new ParagraphElement()..text = "Unable to connect to the server"
      ); 
    });
  });
  
  // Clear input and output
  formClear.onClick.listen((Event e) {
    formResponse.classes.remove("well"); // Remove output styling
    formResponse.children.clear(); // Clear output
  });
}

