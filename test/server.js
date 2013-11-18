
var request = require("request");

var BASE_URL = "http://localhost:9058";

describe("SPARQL endpoint", function() {
  it("return result", function(done) {
    var body = {
      query: "hoge"
    };
    request.post(BASE_URL, done).form(body);
  });
});
