part of server;

class HelloWorld extends Vane {
  // Register the application pipeline with a simple logging middleware
  var pipeline = [Log, This];

  // Define application routes
  @Route("/hello")
  @Route("/hello/{msg}")
  Future hello(String msg) {
    // Respond with a message
    close("Hello ${msg != "" ? msg : "World"}!");
    return end;
  }
}

