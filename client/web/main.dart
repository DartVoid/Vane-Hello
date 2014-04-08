import 'dart:html';

void main() {
  InputElement formInput    = querySelector("#form-input");
  ButtonElement formSubmit  = querySelector("#form-submit");
  InputElement formClear    = querySelector("#form-clear");
  DivElement respWrap       = querySelector("#response-wrapper");
  DivElement formResp       = querySelector("#response");

  formSubmit.onClick.listen((e) {
    e.preventDefault();
    respWrap.classes = ["pure-u-1-1", "well"];
    
    HttpRequest.request("/hello?name=${formInput.value}", method: "GET").then((response) {
      formResp.append(new ParagraphElement()..text = "${response.responseText}");
    }).catchError((e) {
      formResp.appendHtml("<p>Unable to connect to the server</p>");
    });
  });
  
  formClear.onClick.listen((e) {
    respWrap.classes = ["pure-u-1-1"];
    formResp.children.clear();
  });
}

