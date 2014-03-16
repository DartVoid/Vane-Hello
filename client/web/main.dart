import 'dart:html';

void main() {
  var formInput  = querySelector("#form-input");
  var formSubmit = querySelector("#form-submit");
  var formClear  = querySelector("#form-clear");
  var formResp   = querySelector("#form-response");

  formSubmit.onClick.listen((e) {
    e.preventDefault();
    
    HttpRequest.request("/hello?name=${formInput.value}", method: "GET").then((response) {
      formResp.appendHtml("<p>${response.responseText}</p>");
    }).catchError((e) => formResp.appendHtml("<p>Unable to connect to the server</p>"));
  });
  
  formClear.onClick.listen((e) {
    e.preventDefault();
    formResp.children.clear();
  });
}

