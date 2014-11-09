import 'dart:html';
import 'dart:convert' show UTF8;
import 'package:http/browser_client.dart';

void main() {
  BrowserClient client      = new BrowserClient();
  ButtonElement formSubmit  = querySelector("#form-submit");
  InputElement formInput    = querySelector("#form-input");
  InputElement formClear    = querySelector("#form-clear");
  DivElement formResponse   = querySelector("#form-response");

  // Send message
  formSubmit.onClick.listen((Event e) {
    // Prevent form submit
    e.preventDefault();

    // Setup url (port 9090 for during development locally, otherwise use
    // standard port 80 for production)
    Uri uri = Uri.parse(window.location.href);
    var port = uri.port != 8080 ? 80 : 9090;
    Uri url = Uri.parse("http://${uri.host}:${port}/hello/${formInput.value}");

    // Send request
    client.put(Uri.encodeFull(url.toString()), encoding: UTF8).asStream().listen((response) {
      // Display response message
      formResponse.append(
        new ParagraphElement()..text = "${Uri.decodeFull(response.body)}"
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
    formResponse.children.clear();
  });
}

