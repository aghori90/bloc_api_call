import 'package:http/http.dart' as http;

class WebServices{
  callProfileApi() async {
  //  api call via url
    var url = Uri.parse('https://reqres.in/api/users');
    var response = await http.get(url);
    if(response.statusCode==200){
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return response;
    }
    return null;

  }
}