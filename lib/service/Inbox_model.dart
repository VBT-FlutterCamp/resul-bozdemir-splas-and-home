import 'package:carbon_mail_ui/service/model.dart';
import 'package:http/http.dart' as http;

class InboxModel {
  Future<List<InboxTitle>> getPost() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      return inboxTitleFromJson(response.body);
    } else {
      throw Exception("Veri gelmedi");
    }
  }
}
