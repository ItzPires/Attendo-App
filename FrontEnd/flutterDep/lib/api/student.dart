import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void x() async {
  var url = Uri.parse('http://localhost:8000/Student/');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

class Student {
  int number;
  String name;
  String mail;
  Student(this.number, this.name, this.mail);


}
